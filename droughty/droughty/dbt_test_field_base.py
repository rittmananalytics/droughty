
import markdown
import os
import yaml

from droughty.config import DbtTestVariables,IdentifyConfigVariables

droughty_project = os.path.join(IdentifyConfigVariables.git_path,DbtTestVariables.field_description_path,DbtTestVariables.field_description_file_name)

with open(droughty_project) as f:
    htmlmarkdown=markdown.markdown( f.read() )
    
def get_next_words(text, match, sep=' '):
    words = iter(text.split(sep))
    for word in words:
        if word == match:
            yield next(words)
            
text = htmlmarkdown
words = get_next_words(text, 'docs')

described_columns_list = []

for w in words:
    
    described_columns_list.append (w)
