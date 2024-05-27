#!/bin/bash

# Define the JSON content
json_content='{
    "coinApiKey": "YOUR_API_KEY"
}'

# Write the JSON content to a file
echo "$json_content" > env.json

# Success message
echo "env.json file created successfully!"