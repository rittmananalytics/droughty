from flask import Flask
from flask_bootstrap import Bootstrap
from flask_navigation import Navigation

app = Flask(__name__)
nav = Navigation(app)

# ...
bootstrap = Bootstrap(app)

from droughty.droughty_savanna import savanna_home