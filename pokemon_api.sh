#!/bin/bash

# Script to fetch Pikachu data from Pokémon API
# Saves successful response to data.json
# Logs errors to errors.txt

# API endpoint for Pikachu
API_URL="https://pokeapi.co/api/v2/pokemon/pikachu"

# Make the API request and save response to data.json
# If request fails, log error to errors.txt
response=$(curl -s -w "%{http_code}" -o temp_response.json "$API_URL")

# Extract HTTP status code (last 3 characters)
http_code="${response: -3}"

# Check if request was successful (HTTP 200)
if [ "$http_code" == "200" ]; then
    # Move response to data.json
    mv temp_response.json data.json
    echo "Successfully fetched Pikachu data and saved to data.json"
else
    # Log error to errors.txt
    echo "Error: Failed to fetch Pikachu data. HTTP Status Code: $http_code" >> errors.txt
    # Clean up temp file
    rm -f temp_response.json
    echo "Error logged to errors.txt"
fi