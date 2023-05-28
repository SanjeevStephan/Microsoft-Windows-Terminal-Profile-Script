import json

# Read the JSON data from the file
with open('settings.json', 'r') as f:
    data = json.load(f)

# Update the 'alwaysOnTop' property to 'true'
data['alwaysOnTop'] = True

# Write the updated JSON data back to the file
with open('settings.json', 'w') as f:
    json.dump(data, f, indent=4)

