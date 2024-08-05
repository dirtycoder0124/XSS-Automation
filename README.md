
# XSS Automation Script

This Bash script automates the process of collecting and analyzing domain reconnaissance data. It is designed for bug bounty hunting and penetration testing, utilizing various tools to gather URLs, subdomains, and potential XSS vulnerabilities for a given domain.

## Features

- **Automatic Installation**: Installs necessary tools for reconnaissance and vulnerability scanning.
- **Domain Data Collection**: Gathers data using `waybackurls`, `gau`, `subfinder`, and more.
- **Subdomain Discovery**: Identifies active subdomains with `httpx`.
- **URL Crawling**: Uses `gospider`, `hakrawler`, and `katana` for in-depth URL analysis.
- **Path Deduplication**: Normalizes and removes duplicate URLs with `uro`.
- **Live Endpoint Check**: Verifies live endpoints using `httpx`.
- **XSS Vulnerability Detection**: Uses `gf` and `dalfox` to identify potential XSS vulnerabilities.

## Prerequisites

Ensure you have the following installed on your system:

- [Go](https://golang.org/doc/install)
- [Python 3](https://www.python.org/downloads/)

## Installation

Clone the repository and run the script to set up all necessary tools:

```bash
git clone https://github.com/yourusername/domain-recon-script.git
cd domain-recon-script
chmod +x recon.sh
./recon.sh
```
## Note

Before use, remember to replace the Blind XSS payload with your own in the `recon.sh` file, or remove the `-b` option completely.
![image](https://github.com/user-attachments/assets/d61c5b7d-acb9-4634-9dee-c8d4f56386ee)

### The script will install the following tools if they are not already installed:

- `waybackurls`
- `gau`
- `anew`
- `subfinder`
- `httpx`
- `gospider`
- `hakrawler`
- `katana`
- `dalfox`
- `uro`
- `gf`


## Usage

Run the script and follow the prompts to perform reconnaissance on a domain:

```bash
./recon.sh
```
![image](https://github.com/user-attachments/assets/4519493a-b4ba-49eb-af84-7eb8902270a4)

- Enter the domain name when prompted.
- The script will create a `results/<domain>` directory to store output files.
- Each tool will generate specific data files, which will be saved in the corresponding directory.

## Output Files

The script generates several output files for each domain:

- `wayback.txt`: URLs from Wayback Machine.
- `gau.txt`: URLs from Google All URLs.
- `subdomains.txt`: List of discovered subdomains.
- `activesubs.txt`: Active subdomains.
- `gospider.txt`, `hakrawler.txt`, `katana.txt`: URLs crawled from various sources.
- `paths.txt`: Combined and deduplicated list of URLs.
- `live_uro1.txt`: Live endpoints.
- `xss_ready.txt`: Potential XSS vectors.
- `Vulnerable_XSS.txt`: Confirmed XSS vulnerabilities.
![image](https://github.com/user-attachments/assets/6e4b1bd7-0522-4dce-8dda-c0b41a36e9dc)

## Legal Disclaimer

This script is intended for educational purposes only. It is designed for use in authorized bug bounty programs and penetration testing engagements. The author is not responsible for any illegal activity or misuse of this tool. Ensure you have proper authorization before using this script on any target.

## Troubleshooting

If you encounter any issues with installation or execution, ensure that your environment meets all prerequisites and that your `GOPATH` and `PATH` are correctly set.

## Contributing

Contributions are welcome! Please submit a pull request or open an issue to suggest improvements or report bugs.

## Acknowledgments

- Inspired by various open-source reconnaissance tools and methodologies.
- Special thanks to the authors of the tools used in this script.
