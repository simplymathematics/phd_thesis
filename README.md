# Documentation Compilation
To compile this document, you first need to install `dvc`. 
Because Overleaf does not support git submodules, we must hack the equivalent together using the file-tracking abilities of `dvc` and the power of `wget`. 

To install a virtual environment (assuming pip is installed) run:

```bash
python -m venv env
source env/bin/activate  # On Windows, use `env\Scripts\activate`
pip install -r requirements.txt
```

## Setting Up DVC
After setting up the virtual environment, initialize `dvc` and use it to fetch the most recent version of the included repositories:
```
dvc repro
```

This command will execute the commands listed under the `stages` heading in the `dvc.yaml` file, with dependencies and outputs specified and tracked so that only updated folders require additional rendering calls.

