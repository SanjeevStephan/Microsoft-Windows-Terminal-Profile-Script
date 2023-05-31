import json
from prettytable import PrettyTable

def readfilelist() : 

    # Open the file containing the JSON data
    with open('myFileList.json', 'r') as f:
        # Load the JSON data from the file
        data = json.load(f)

    # Extract the 'path' value from the JSON data
    jsonPath = data[1]['Path']
    readsetting(jsonPath)

    # Display the 'path' value
    print(f"JSON file path: {jsonPath}")

def readsetting(jsonPath) :

    # Load JSON data from file
    with open(jsonPath) as f:
        data = json.load(f)

    # Create a new PrettyTable instance
    table = PrettyTable()

    # Define table headers
    table.field_names = ['Action', 'Keys']

    # Add rows to table
    for item in data['actions']:
        table.add_row([item['command'], item['keys']])

    # Set table style
    table.align = 'l'
    table.border = True
    table.header_style = 'upper'

    # Print table
    print(table)

readfilelist()
#readsetting()
