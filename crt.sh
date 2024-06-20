#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: $0 <input-file>"
    exit 1
fi

input_file=$1

output_dir="output"
mkdir -p "$output_dir"

while IFS= read -r domain; do
    clean_domain=$(echo "$domain" | xargs)
    
    if [ -z "$clean_domain" ]; then
        continue
    fi

    output_file="$output_dir/subdomains.$clean_domain.txt"
    
    echo "[*] Processing domain: $clean_domain"
    
    curl -s "https://crt.sh/?q=%25.$clean_domain&output=json" | \
    jq -r '.[].name_value' | \
    sed 's/\\n/\n/g' | \
    sed 's/\*.//g' | \
    sort -u > "$output_file"
    
    echo "[*] Subdomains for $clean_domain saved to $output_file"
    echo -e "Total subdomains found: $(wc -l < "$output_file")\n"
done < "$input_file"

echo "All domains processed. Check the 'output' directory for results."
