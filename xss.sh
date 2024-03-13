#!/bin/bash

# Prompting user for domain input
read -p "Enter the domain: " domain

# Checking if the domain is provided
if [ -z "$domain" ]; then
    echo "Error: Domain not provided."
    exit 1
fi

# Create folder for the domain
folder="$domain"
mkdir -p "$folder"

# Running subfinder to find subdomains
echo "Running subfinder..."
subfinder -d "$domain" -o "$folder/subdomains_tmp.txt"

# Running amass to find subdomains
echo "Running amass..."
amass enum -d "$domain" -o "$folder/subdomains_tmp.txt"

# Cleaning and sorting subdomains
echo "Cleaning and sorting subdomains..."
sort -u "$folder/subdomains_tmp.txt" > "$folder/subdomains.txt"
rm "$folder/subdomains_tmp.txt"

# Running httpx to find live subdomains
echo "Finding live subdomains..."
httpx -l "$folder/subdomains.txt" -o "$folder/live_subdomains.txt"

# Running gau to find endpoints
echo "Finding endpoints with gau..."
echo "$domain" | gau --threads 5 >> "$folder/Endpoints.txt"

# Running katana with -jc flag to find more endpoints
echo "Finding endpoints with katana..."
cat "$folder/live_subdomains.txt" | katana -jc >> "$folder/Endpoints.txt"

# Removing duplicates using uro
echo "Removing duplicates from Endpoints.txt..."
uro -i "$folder/Endpoints.txt" -o "$folder/Endpoints.txt"

# Using gf xss matcher to find XSS vulnerabilities
echo "Finding XSS vulnerabilities with gf..."
cat "$folder/Endpoints.txt" | gf xss >> "$folder/xss.txt"

# Using Gxss to send payloads to potential XSS endpoints
echo "Sending payloads with Gxss..."
cat "$folder/xss.txt" | Gxss -p khXSS -o "$folder/XSS_Ref.txt"

# Analyzing XSS references with dalfox
echo "Analyzing XSS references with dalfox..."
dalfox file "$folder/XSS_Ref.txt" -o "$folder/Vulnerable_XSS.txt"

echo "Vulnerable XSS endpoints saved in $folder/Vulnerable_XSS.txt"
