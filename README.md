# Subdomain Takeover Check Script

This Bash script automates the process of checking subdomain enumeration and subdomain takeover vulnerabilities using Subfinder and Subzy.

## Prerequisites

- **Subfinder**: Ensure Subfinder is installed and configured on your system. Install it using:
  
  go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest

Ensure Subzy is installed and configured on your system. Install it using:

go install -v github.com/LukaSikic/subzy@latest


chmod +x subdomain_check.sh

./subdomain_check.sh <domain>



Subfinder: Uses Subfinder to enumerate all possible subdomains (-all flag) for the specified domain.
Subzy: Runs Subzy to check for subdomain takeover vulnerabilities based on the subdomains found by Subfinder.

