# Reconnaissance Script Documentation

## Overview

This script is designed to automate the reconnaissance process for a given target domain. It utilizes a range of tools and techniques to gather information and identify potential vulnerabilities.

## Features

- **DNS Lookup**: Performs basic DNS queries to gather information about the target's DNS configuration.
- **Subdomain Enumeration**: Identifies subdomains using various tools and techniques.
- **Port Scanning**: Scans for open ports using Nmap and Masscan.
- **Web Technologies Detection**: Identifies web technologies used by the target.
- **URL Enumeration**: Enumerates URLs using Wayback Machine and Google Analytics data.
- **GitHub Search**: Searches for information related to the target on GitHub.
- **Fuzzing**: Identifies hidden files and directories on the target web server.
- **Screenshotting**: Captures screenshots of live subdomains.
- **Vulnerability Scanning**: Uses Nuclei to find known vulnerabilities.
- **Metadata Extraction**: Extracts metadata from public documents associated with the target.
- **OSINT Collection**: Gathers additional open-source intelligence using tools like theHarvester.

## Prerequisites

Before running the script, ensure that you have the following tools installed on your system:

- [Whois](https://github.com/rfc1036/whois)
- [Nslookup](https://man7.org/linux/man-pages/man1/nslookup.1.html)
- [Dig](https://man7.org/linux/man-pages/man1/dig.1.html)
- [Host](https://man7.org/linux/man-pages/man1/host.1.html)
- [Sublist3r](https://github.com/aboul3la/Sublist3r)
- [Amass](https://github.com/OWASP/Amass)
- [Assetfinder](https://github.com/tomnomnom/assetfinder)
- [Findomain](https://github.com/Findomain/Findomain)
- [MassDNS](https://github.com/blechschmidt/massdns)
- [HTTProbe](https://github.com/tomnomnom/httprobe)
- [Nmap](https://nmap.org/)
- [WhatWeb](https://github.com/urbanadventurer/WhatWeb)
- [Waybackurls](https://github.com/tomnomnom/waybackurls)
- [GAU (GetAllURLs)](https://github.com/lc/gau)
- [Hakrawler](https://github.com/hakluke/hakrawler)
- [GitHub Search](https://github.com/gwen001/github-search)
- [GitRob](https://github.com/michenriksen/gitrob)
- [Fierce](https://github.com/mschwager/fierce)
- [Dirsearch](https://github.com/maurosoria/dirsearch)
- [FFUF (Fuzz Faster U Fool)](https://github.com/ffuf/ffuf)
- [GoWitness](https://github.com/sensepost/gowitness)
- [Nuclei](https://github.com/projectdiscovery/nuclei)
- [Metagoofil](https://github.com/opsdisk/metagoofil)
- [theHarvester](https://github.com/laramies/theHarvester)
- [DNSTwist](https://github.com/elceef/dnstwist)
- [Shodan CLI](https://cli.shodan.io/)
- [Censys CLI](https://censys.io/)
- [SpiderFoot](https://www.spiderfoot.net/)
- [Subfinder](https://github.com/projectdiscovery/subfinder)
- [WafW00f](https://github.com/EnableSecurity/wafw00f)
- [Arjun](https://github.com/s0md3v/Arjun)
- [Subjack](https://github.com/haccer/subjack)
- [Meg](https://github.com/tomnomnom/meg)
- [Waymore](https://github.com/xnl-h4ck3r/waymore)
- [Unfurl](https://github.com/tomnomnom/unfurl)
- [Dalfox](https://github.com/hahwul/dalfox)
- [GoSpider](https://github.com/jaeles-project/gospider)
- [Recon-ng](https://github.com/lanmaster53/recon-ng)
- [XRAY](https://github.com/chaitin/xray)
- [Git-Secrets](https://github.com/awslabs/git-secrets)
- [ShuffleDNS](https://github.com/projectdiscovery/shuffledns)
- [DNSGen](https://github.com/ProjectAnte/dnsgen)
- [MapCIDR](https://github.com/projectdiscovery/mapcidr)
- [Tko-subs](https://github.com/anshumanbh/tko-subs)
- [Kiterunner](https://github.com/assetnote/kiterunner)
- [Github-dorker](https://github.com/obheda12/GitDorker)
- [GFRedirect](https://github.com/dwisiswant0/gf-redirect)
- [ParamSpider](https://github.com/devanshbatham/ParamSpider)
- [Dirb](https://dirb.sourceforge.net/)
- [WPScan](https://github.com/wpscanteam/wpscan)
- [Cloud Enum](https://github.com/initstring/cloud_enum)
- [Gobuster](https://github.com/OJ/gobuster)
- [Subzero](https://github.com/coalfire/subzero)
- [DNSWalk](https://dnswalk.sourceforge.net/)
- [Masscan](https://github.com/robertdavidgraham/masscan)
- [XSStrike](https://github.com/s0md3v/XSStrike)
- [httpx](https://github.com/projectdiscovery/httpx)

### Installing Dependencies

Install the necessary tools using package managers or by following their respective installation guides. Most tools can be installed using `apt`, `brew`, `pip`, or cloning their repositories.

### System Requirements

- **Operating System**: Linux or macOS
- **RAM**: Minimum 4GB
- **Disk Space**: At least 10GB free for storing results and logs
- **Network**: Stable internet connection for OSINT tools and enumeration tasks

## Script Usage

### Running the Script

1. **Clone the repository** (if applicable) or save the script file:

    ```bash
    git clone https://github.com/your-repo/recon-script.git
    cd recon-script
    ```

2. **Make the script executable**:

    ```bash
    chmod +x recon.sh
    ```

3. **Run the script with a target domain**:

    ```bash
    ./recon.sh example.com
    ```

    Replace `example.com` with your target domain.

### Options

- **Log Directory**: By default, logs are stored in the `logs/` directory.
- **Results Directory**: Output files are saved in the `results/` directory.
- **Resolvers**: Update the `resolvers.txt` file with a list of DNS resolvers.

### Sample Command

```bash
./recon.sh target.com
