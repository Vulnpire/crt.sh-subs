# crt.sh

fetches and processes subdomains for a list of domains using the `crt.sh` certificate transparency log. It reads domains from an input file, queries `crt.sh` for each domain, and saves the results to a corresponding output file.

## Features

- Fetches subdomains from the `crt.sh` database.
- Processes and cleans the subdomain list to remove wildcards and duplicates.
- Saves results in a structured output directory.

## Requirements

- **bash**: The script is written in bash, so you need a Unix-like environment.
- **jq**: A lightweight and flexible command-line JSON processor.
- **curl**: A command-line tool for transferring data with URLs.

## Usage

`git clone https://github.com/Vulnpire/crt.sh-subs && cd crt.sh-subs && chmod +x crt.sh && mv ./crt.sh /usr/bin/ && cd - && rm -rf crt.sh-subs`

## Prepare Your Input File

Create a text file (e.g., `wildcards.txt`) with a list of domains you want to search, one domain per line.

## Run the script

`crt.sh wildcards.txt`

## Output:

The script will create an output directory and save the subdomains for each domain in a separate file named `subdomains.<domain>.txt`.
