[How to Use Requirement][def]

[def]: https://datagy.io/python-requirements-txt/

```
pip freeze > requirements.txt
```
When you run this code, a new file will be created in the directory you’re working in. This file will list the different packages and modules in your virtual environment. That’s really all there is to it!
In addition, running this code will also include the version numbers in the file.

## Run Command in One GO
One of the benefits of using a requirements.txt file is that users of your code can install all required libraries and modules in one command.
```
pip install -r requirements.txt
```
This will read the file and install all the packages in that file. Your terminal will output a list of all the libraries that have been installed and raise any errors if they occur.

## How to Maintain a requirements.txt
If you want to check what packages are out of date, you can use the following command:
```
pip list --outdated
```
This will list out all the packages where your package version is out of date, listing out your version and the most current version.

In order to update to the latest version of a package, you can use the command below:
```
pip install -U package_name
```
This will upgrade your version to the latest version. Once this is done, you can refreeze your requirements by re-running the `pip freeze > requirements.txt` command.