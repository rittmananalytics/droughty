"""Knowledge Graph Builder for droughty QA modules."""
from google.cloud import bigquery
from neo4j import GraphDatabase
import openai
from typing import List, Dict, Tuple
import pandas as pd
import re
from tqdm import tqdm
from droughty.droughty_core.config import ProjectVariables

class KnowledgeGraphBuilder:
    """Build knowledge graphs from BigQuery schemas."""
    
    def __init__(self):
        """Initialize clients and connections."""
        # Initialize OpenAI client with API key
        self.openai_client = openai.OpenAI(
            api_key=ProjectVariables.openai_secret
        )
        self.model = "gpt-4"
        
        # Initialize BigQuery client
        self.bq_client = bigquery.Client(
            project=ProjectVariables.project,
            credentials=ProjectVariables.service_account
        )
        
        # Initialize Neo4j driver with connection test
        try:
            print(f"Attempting to connect to Neo4j at {ProjectVariables.neo4j_uri}")
            self.neo4j_driver = GraphDatabase.driver(
                ProjectVariables.neo4j_uri,
                auth=(ProjectVariables.neo4j_user, ProjectVariables.neo4j_password)
            )
            # Test the connection
            with self.neo4j_driver.session() as session:
                session.run("RETURN 1")
            print("Successfully connected to Neo4j")
        except Exception as e:
            print("Failed to connect to Neo4j. Please check:")
            print("1. Is Neo4j running? (brew services list | grep neo4j)")
            print("2. Is the connection URI correct?")
            print("3. Are the username and password correct?")
            print(f"\nConnection details used:")
            print(f"URI: {ProjectVariables.neo4j_uri}")
            print(f"User: {ProjectVariables.neo4j_user}")
            print(f"Error: {str(e)}")
            raise ConnectionError("Could not connect to Neo4j")

    def get_schema_info(self) -> Dict[str, Dict]:
        """Extract schema information from BigQuery tables."""
        print(f"Analyzing BigQuery schema for dataset: {ProjectVariables.schema}")
        schema_info = {}
        
        # Get reference to specific dataset
        dataset_ref = self.bq_client.dataset(ProjectVariables.schema)
        tables = list(self.bq_client.list_tables(dataset_ref))
        
        with tqdm(total=len(tables), desc="Processing tables") as pbar:
            for table in tables:
                pbar.set_description(f"Processing table: {table.table_id}")
                table_ref = self.bq_client.get_table(table.reference)
                fields = []
                pks = []
                fks = {}
                
                for field in table_ref.schema:
                    fields.append(field.name)
                    if field.name.endswith('_pk'):
                        pks.append(field.name)
                    elif field.name.endswith('_fk'):
                        referenced_table = field.name.rsplit('_', 2)[0]
                        fks[field.name] = referenced_table
                
                schema_info[table.table_id] = {
                    'fields': fields,
                    'primary_keys': pks,
                    'foreign_keys': fks
                }
                pbar.update(1)
        
        return schema_info

    def generate_cypher_schemas(self, schema_info: Dict) -> List[str]:
        """Generate Cypher statements for creating node constraints and indexes."""
        cypher_statements = []
        
        for table, info in schema_info.items():
            # Create node label constraint
            if info['primary_keys']:
                pk = info['primary_keys'][0]  # Using first PK if multiple exist
                stmt = f"CREATE CONSTRAINT IF NOT EXISTS FOR (n:{table}) REQUIRE n.{pk} IS UNIQUE"
                cypher_statements.append(stmt)
            
            # Create indexes for foreign keys
            for fk in info['foreign_keys'].keys():
                stmt = f"CREATE INDEX IF NOT EXISTS FOR (n:{table}) ON (n.{fk})"
                cypher_statements.append(stmt)
        
        return cypher_statements

    def extract_relationships_with_llm(self, schema_info: Dict) -> List[Dict]:
        """Use LLM to identify and describe relationships between entities."""
        try:
            # Prepare schema description for LLM
            schema_description = "Database Schema:\n"
            for table, info in schema_info.items():
                schema_description += f"\nTable: {table}\n"
                schema_description += f"Fields: {', '.join(info['fields'])}\n"
                schema_description += f"Primary Keys: {', '.join(info['primary_keys'])}\n"
                schema_description += f"Foreign Keys: {str(info['foreign_keys'])}\n"

            prompt = f"""
            Analyze this database schema and identify meaningful relationships between entities.
            Return ONLY a JSON array (no other text) with objects containing these exact fields:
            - source_table: The table where the relationship starts
            - source_field: The field in the source table
            - target_table: The table where the relationship points to
            - target_field: The field in the target table
            - relationship_type: A descriptive relationship type (e.g., HAS, BELONGS_TO, CREATED)
            - description: A clear description of what this relationship means

            Schema to analyze:
            {schema_description}
            """

            print("\nGenerating relationships using LLM...")
            response = self.openai_client.chat.completions.create(
                model=self.model,
                messages=[{"role": "user", "content": prompt}]
            )

            # Extract JSON from response
            import json
            relationships_text = response.choices[0].message.content.strip()
            relationships = json.loads(relationships_text)
            
            print(f"Generated {len(relationships)} relationships")
            return relationships
            
        except Exception as e:
            print(f"Error in LLM processing: {str(e)}")
            print("LLM Response:", response.choices[0].message.content if 'response' in locals() else "No response")
            return []

    def _convert_property_value(self, value):
        """Convert BigQuery data types to Neo4j compatible types."""
        from decimal import Decimal
        import datetime
        
        if isinstance(value, Decimal):
            return float(value)
        elif isinstance(value, datetime.datetime):
            return value.isoformat()
        elif isinstance(value, datetime.date):
            return value.isoformat()
        elif isinstance(value, bytes):
            return value.decode('utf-8')
        return value

    def create_knowledge_graph(self, schema_info: Dict, relationships: List[Dict]):
        """Create knowledge graph in Neo4j based on schema and relationships."""
        with self.neo4j_driver.session() as session:
            print("Setting up Neo4j schema...")
            # Create schema constraints and indexes
            cypher_statements = self.generate_cypher_schemas(schema_info)
            for stmt in tqdm(cypher_statements, desc="Creating constraints and indexes"):
                session.run(stmt)

            # Load data from BigQuery and create nodes
            print("\nLoading data and creating nodes...")
            total_tables = len(schema_info)
            with tqdm(total=total_tables, desc="Processing tables") as pbar:
                for table, info in schema_info.items():
                    pbar.set_description(f"Processing table: {table}")
                    
                    # Fetch data from BigQuery
                    query = f"SELECT * FROM `{ProjectVariables.schema}.{table}`"
                    df = self.bq_client.query(query).to_dataframe()
                    
                    # Create nodes for each row
                    with tqdm(total=len(df), desc="Creating nodes", leave=False) as row_pbar:
                        for _, row in df.iterrows():
                            # Convert properties to Neo4j compatible types
                            properties = {
                                col: self._convert_property_value(row[col])
                                for col in info['fields'] 
                                if pd.notna(row[col])
                            }
                            
                            if not info['primary_keys']:
                                print(f"Warning: No primary key found for table {table}")
                                continue
                                
                            cypher = f"""
                            MERGE (n:{table} {{{info['primary_keys'][0]}: $pk}})
                            SET n += $properties
                            """
                            
                            try:
                                session.run(
                                    cypher, 
                                    pk=self._convert_property_value(row[info['primary_keys'][0]]),
                                    properties=properties
                                )
                            except Exception as e:
                                print(f"Error creating node in table {table}: {str(e)}")
                                print(f"Properties causing error: {properties}")
                                continue
                                
                            row_pbar.update(1)
                    pbar.update(1)

            # Create relationships based on LLM analysis
            print("\nCreating relationships...")
            for rel in tqdm(relationships, desc="Creating relationships"):
                cypher = f"""
                MATCH (source:{rel['source_table']}), (target:{rel['target_table']})
                WHERE source.{rel['source_field']} = target.{rel['target_field']}
                MERGE (source)-[r:{rel['relationship_type']} {{description: $desc}}]->(target)
                """
                
                session.run(cypher, desc=rel['description'])

    def close(self):
        """Close all connections."""
        self.neo4j_driver.close()
        self.bq_client.close()


def main():
    """Main entry point for the knowledge graph builder."""
    try:
        # Initialize the builder using ProjectVariables
        builder = KnowledgeGraphBuilder()

        # Extract schema information
        schema_info = builder.get_schema_info()
        
        # Generate relationships using LLM
        relationships = builder.extract_relationships_with_llm(schema_info)
        
        # Create knowledge graph
        if relationships:
            builder.create_knowledge_graph(schema_info, relationships)
            print("Knowledge graph created successfully!")
        else:
            print("No relationships were generated. Check the OpenAI configuration.")
            
    except Exception as e:
        print(f"Error during knowledge graph creation: {str(e)}")
        return 1
        
    finally:
        builder.close()
        
    return 0

if __name__ == "__main__":
    main()