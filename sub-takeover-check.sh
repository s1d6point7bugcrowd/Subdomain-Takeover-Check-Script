#!/bin/bash

# Check if both tools are installed
if ! command -v subfinder &> /dev/null; then
    echo "Subfinder is not installed. Please install it first."
    exit 1
fi

if ! command -v subzy &> /dev/null; then
    echo "Subzy is not installed. Please install it first."
    exit 1
fi

# Check for the required domain argument
if [ -z "$1" ]; then
    echo "Usage: $0 <domain>"
    exit 1
fi

DOMAIN=$1
OUTPUT_FILE="domains.txt"

# Run Subfinder to enumerate all possible subdomains
echo "Running Subfinder for domain: $DOMAIN"
subfinder -d $DOMAIN -all -silent | tee $OUTPUT_FILE

# Check if Subfinder found any subdomains
if [ ! -s $OUTPUT_FILE ]; then
    echo "No subdomains found for $DOMAIN"
    exit 0
fi

# Run Subzy to check for subdomain takeover vulnerabilities
echo "Running Subzy for the found subdomains"
subzy run --targets $OUTPUT_FILE

# Cleanup
rm $OUTPUT_FILE

echo "Subdomain takeover check completed for $DOMAIN"
