from flask import Flask
from flask_bootstrap import Bootstrap

app = Flask(__name__)
# ...
bootstrap = Bootstrap(app)

from droughty.droughty_savanna import savanna_home