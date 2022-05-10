from droughty.lookml_cli import base 
#from droughty import dbt_test_cli
#from droughty import dbml_cli
#from droughty import cube_cli
from droughty.config_cli import Common #profile_parser#,argument_profile

##app.add_typer(dbt_test_cli.app, name="dbt")
##app.add_typer(dbml_cli.app, name="dbml")
##app.add_typer(cube_cli.app, name="cube")

##app.add_typer(config_cli.app)

#####

import argparse


def start():

    # All the logic of argparse goes in this function

    # parser = argparse.ArgumentParser(description='Say hi.')

    #profile_func()

    if Common.args_command == 'lookml':

        base()

        print('I have a command')

    else:

        print('I have no command')

    #lookml = parser.add_subparsers(help='sub-command help')

#    parser_ahoy = lookml.add_parser('--lookml', type=str, help='lookml is cool sub-command')
#    parser_ahoy.add_argument('--bar', type=int, help='bar is useful option')

if __name__ == '__main__':
    start()


# import argparse
# parser = argparse.ArgumentParser()
# subparser = parser.add_subparsers(dest='command')
# login = subparser.add_parser('login')
# register = subparser.add_parser('register')
# 
# login.add_argument('--username', type=str, required=True)
# login.add_argument('--password', type=str, required=True)
# 
# register.add_argument('--firstname', type=str, required=True)
# register.add_argument('--lastname', type=str, required=True)
# register.add_argument('--username', type=str, required=True)
# register.add_argument('--email', type=str, required=True)
# register.add_argument('--password', type=str, required=True)
# 
# args = parser.parse_args()
# 
# if args.command == 'login':
#   print('Logging in with username:', args.username,
#   'and password:', args.password)
# elif args.command == 'register':
#   print('Creating username', args.username,
#   'for new member', args.firstname, args.lastname,
#   'with email:', args.email,
#   'and password:', args.password)