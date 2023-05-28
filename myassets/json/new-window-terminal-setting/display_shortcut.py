import json
from prettytable import PrettyTable

# Load JSON data from file
with open('settings.json') as f:
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

