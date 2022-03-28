
import markdown
import os
import yaml
import git


def get_git_root(path):

        git_repo = git.Repo(path, search_parent_directories=True)
        git_root = git_repo.git.rev_parse("--show-toplevel")
        return (git_root)
    
git_def_path = get_git_root(os.getcwd())

git_path = git_def_path

path = os.path.expanduser('~')

filename = 'droughty_project.yaml'

droughty_project = os.path.join(git_path,filename)

with open(droughty_project) as f:
    enviroment_project = yaml.load(f, Loader=yaml.FullLoader)


field_description_path = (enviroment_project.get("field_description_path"))

filename = 'field_descriptions.md'

droughty_project = os.path.join(git_path,field_description_path,filename)

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
