import typer

from lookml_explore_module import explore_output

def main():
    return explore_output()


if __name__ == "__main__":
    typer.run(main)