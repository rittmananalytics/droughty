from droughty.droughty_savanna import app
from droughty.droughty_hydrometer.referential_integrity import ProjectHealth
from flask import render_template

#@app.route('/')
#@app.route('/index')
#def index():
#    users = ProjectHealth.orphaned_fks
#    return render_template('bootstrap_table.html', title='Hydrometer',
#                           users=users)

@app.route("/")
def view_home():
    return render_template("index.html", title="Droughty")

@app.route("/first")
def view_first_page():
    return render_template("index.html", title="First page")

@app.route("/second")
def view_second_page():
    users = ProjectHealth.orphaned_fks
    return render_template("bootstrap_table.html", title="Hydrate",
                          users=users)