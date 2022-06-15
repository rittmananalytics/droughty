from droughty.droughty_savanna import app
from droughty.droughty_hydrometer.referential_integrity import ProjectHealth
from flask import render_template

@app.route('/')
@app.route('/index')
def index():
    user = ProjectHealth.orphaned_fks
    return render_template('bootstrap_table.html', title='Bootstrap Table',
                           user=user)