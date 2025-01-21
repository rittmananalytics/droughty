"""GraphRAG-based chatbot for knowledge graph interactions."""
from neo4j import GraphDatabase
import openai
from typing import List, Dict, Tuple
import numpy as np
from droughty.droughty_core.config import ProjectVariables

class GraphRAGChatbot:
    """GraphRAG-based chatbot that leverages knowledge graph for contextual responses."""
    
    def __init__(self):
        """Initialize connections and embedding model."""
        # Initialize OpenAI client
        self.openai_client = openai.OpenAI(
            api_key=ProjectVariables.openai_secret
        )
        self.chat_model = "gpt-4"
        self.embedding_model = "text-embedding-3-large"
        
        # Initialize Neo4j driver
        try:
            self.neo4j_driver = GraphDatabase.driver(
                ProjectVariables.neo4j_uri,
                auth=(ProjectVariables.neo4j_user, ProjectVariables.neo4j_password)
            )
            with self.neo4j_driver.session() as session:
                session.run("RETURN 1")
            print("Successfully connected to Neo4j")
        except Exception as e:
            print(f"Failed to connect to Neo4j: {str(e)}")
            raise ConnectionError("Could not connect to Neo4j")

    def get_embedding(self, text: str) -> List[float]:
        """Generate embeddings for text using OpenAI's API."""
        response = self.openai_client.embeddings.create(
            input=text,
            model=self.embedding_model
        )
        return response.data[0].embedding

    def find_relevant_subgraph(self, query: str, max_nodes: int = 5) -> Dict:
        """Find the most relevant subgraph for the query using embeddings."""
        query_embedding = self.get_embedding(query)
        
        with self.neo4j_driver.session() as session:
            # Get all nodes with their properties as text
            result = session.run("""
                MATCH (n)
                WITH n, properties(n) as props
                RETURN n.label as label, props, id(n) as node_id
            """)
            
            nodes = []
            embeddings = []
            node_ids = []
            
            for record in result:
                # Convert node properties to text
                node_text = f"{record['label']}: {str(record['props'])}"
                nodes.append(node_text)
                node_ids.append(record['node_id'])
                embeddings.append(self.get_embedding(node_text))
            
            # Calculate cosine similarity
            similarities = np.dot(embeddings, query_embedding) / (
                np.linalg.norm(embeddings, axis=1) * np.linalg.norm(query_embedding)
            )
            
            # Get top k most similar nodes
            top_k_indices = np.argsort(similarities)[-max_nodes:]
            relevant_node_ids = [node_ids[i] for i in top_k_indices]
            
            # Extract subgraph containing these nodes and their relationships
            subgraph = session.run("""
                MATCH (n)
                WHERE id(n) IN $node_ids
                CALL apoc.path.subgraphAll(n, {
                    maxLevel: 2,
                    limit: 10
                })
                YIELD nodes, relationships
                RETURN nodes, relationships
            """, node_ids=relevant_node_ids)
            
            # Convert subgraph to dictionary format
            subgraph_data = subgraph.single()
            return {
                'nodes': [dict(node) for node in subgraph_data['nodes']],
                'relationships': [dict(rel) for rel in subgraph_data['relationships']]
            }

    def format_subgraph_context(self, subgraph: Dict) -> str:
        """Format subgraph information into a context string for the LLM."""
        context = "Knowledge Graph Context:\n\n"
        
        # Add node information
        context += "Entities:\n"
        for node in subgraph['nodes']:
            context += f"- {node['label']}: {dict(node['properties'])}\n"
        
        # Add relationship information
        context += "\nRelationships:\n"
        for rel in subgraph['relationships']:
            context += f"- {rel['type']}: {dict(rel['properties'])}\n"
            
        return context

    def generate_response(self, query: str, subgraph_context: str) -> str:
        """Generate a response using the LLM based on the query and subgraph context."""
        prompt = f"""
        Use the following knowledge graph context to answer the question.
        Only use information provided in the context, and if you can't answer based on the context,
        say so clearly.

        {subgraph_context}

        Question: {query}

        Answer the question while explaining how you used the knowledge graph information to arrive
        at your response. If multiple paths or relationships in the graph are relevant, explain how
        they connect to provide the answer.
        """

        response = self.openai_client.chat.completions.create(
            model=self.chat_model,
            messages=[
                {"role": "system", "content": "You are a helpful assistant that answers questions based on knowledge graph information."},
                {"role": "user", "content": prompt}
            ],
            temperature=0.7
        )
        
        return response.choices[0].message.content

    def chat(self, query: str) -> str:
        """Main chat interface that processes queries and returns responses."""
        try:
            # Find relevant subgraph
            subgraph = self.find_relevant_subgraph(query)
            
            # Format subgraph into context
            context = self.format_subgraph_context(subgraph)
            
            # Generate and return response
            return self.generate_response(query, context)
            
        except Exception as e:
            return f"I encountered an error while processing your query: {str(e)}"

    def close(self):
        """Close all connections."""
        self.neo4j_driver.close()


def retrieval_main():
    """Main entry point for the chatbot."""
    chatbot = GraphRAGChatbot()
    
    print("GraphRAG Chatbot initialized. Type 'exit' to quit.")
    
    try:
        while True:
            query = input("\nYou: ").strip()
            
            if query.lower() == 'exit':
                break
                
            response = chatbot.chat(query)
            print("\nChatbot:", response)
            
    except KeyboardInterrupt:
        print("\nExiting chatbot...")
    
    finally:
        chatbot.close()

if __name__ == "__main__":
    retrieval_main()