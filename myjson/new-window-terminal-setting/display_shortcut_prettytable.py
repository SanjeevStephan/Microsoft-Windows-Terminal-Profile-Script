import json
from prettytable import PrettyTable

# Load JSON data from file
with open('settings.json') as f:
    data = json.load(f)


# Create a new pretty table with headers
table = PrettyTable()
table.field_names = ["Command", "Keys", "Action", "SingleLine", "Input", "Split", "SplitMode"]

# Loop through each action and add the values to the table
for action in data["actions"]:
    command = action.get("command")
    keys = action.get("keys")
    table.add_row([
        command.get("action") if isinstance(command, dict) else command,
        keys,
        command.get("action") if isinstance(command, dict) else "",
        command.get("singleLine") if isinstance(command, dict) else "",
        command.get("input") if isinstance(command, dict) else "",
        command.get("split") if isinstance(command, dict) else "",
        command.get("splitMode") if isinstance(command, dict) else ""
    ])

# Print the table
print(table)

