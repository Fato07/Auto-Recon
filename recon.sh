#!/bin/bash

# Check if a target domain is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <target_domain>"
  exit 1
fi

TARGET=$1
LOG_DIR="logs"
RESULTS_DIR="results"
mkdir -p $LOG_DIR $RESULTS_DIR

log() {
  echo "[INFO] $1" | tee -a "$LOG_DIR/script.log"
}

log "Starting reconnaissance on $TARGET"

# Whois
log "Running whois"
whois $TARGET > "$RESULTS_DIR/whois.txt"

# DNS lookups
log "Running nslookup"
nslookup $TARGET > "$RESULTS_DIR/nslookup.txt"
log "Running dig"
dig $TARGET > "$RESULTS_DIR/dig.txt"
log "Running host -t ns"
host -t ns $TARGET > "$RESULTS_DIR/host_ns.txt"
log "Running host -t mx"
host -t mx $TARGET > "$RESULTS_DIR/host_mx.txt"

# Subdomain enumeration
log "Running sublist3r"
sublist3r -d $TARGET -o "$RESULTS_DIR/sublister.txt"
log "Running amass enum"
amass enum -d $TARGET -o "$RESULTS_DIR/amass_enum.txt"
log "Running assetfinder"
assetfinder --subs-only $TARGET > "$RESULTS_DIR/assetfinder.txt"
log "Running findomain"
findomain -t $TARGET -o "$RESULTS_DIR/findomain.txt"
log "Running massdns"
massdns -r resolvers.txt -t A -o S -w "$RESULTS_DIR/massdns.txt" "$RESULTS_DIR/subdomains.txt"

# Live subdomain check
log "Running httprobe"
cat "$RESULTS_DIR/subdomains.txt" | httprobe > "$RESULTS_DIR/live_subdomains.txt"

# Scanning
log "Running nmap"
nmap -iL "$RESULTS_DIR/live_subdomains.txt" -oA "$RESULTS_DIR/nmap_scan"
log "Running whatweb"
whatweb -i "$RESULTS_DIR/live_subdomains.txt" > "$RESULTS_DIR/whatweb.txt"

# URL enumeration
log "Running waybackurls"
waybackurls $TARGET | tee "$RESULTS_DIR/waybackurls.txt"
log "Running gau"
gau $TARGET | tee "$RESULTS_DIR/gau.txt"
log "Running hakrawler"
hakrawler -url $TARGET.com -depth 2 -plain | tee "$RESULTS_DIR/hakrawler.txt"

# GitHub search
log "Running github-search"
github-search $TARGET > "$RESULTS_DIR/github_search.txt"
log "Running gitrob"
gitrob -repo $TARGET.com

# DNS brute force
log "Running fierce"
fierce --domain $TARGET.com > "$RESULTS_DIR/fierce.txt"
log "Running dirsearch"
dirsearch -u $TARGET.com -e * > "$RESULTS_DIR/dirsearch.txt"

# Fuzzing
log "Running ffuf"
ffuf -w wordlist.txt -u https://$TARGET.com/FUZZ > "$RESULTS_DIR/ffuf.txt"

# Screenshots
log "Running gowitness"
gowitness file -f "$RESULTS_DIR/live_subdomains.txt" -P "$RESULTS_DIR/screenshots/"

# Vulnerability scanning
log "Running nuclei"
nuclei -l "$RESULTS_DIR/live_subdomains.txt" -t templates/ > "$RESULTS_DIR/nuclei.txt"

# Metadata extraction
log "Running metagoofil"
metagoofil -d $TARGET.com -t doc,pdf,xls,docx,xlsx,ppt,pptx -l 100 > "$RESULTS_DIR/metagoofil.txt"

# Harvesting
log "Running theHarvester"
theHarvester -d $TARGET.com -l 500 -b all > "$RESULTS_DIR/theHarvester.txt"

# Other tools
log "Running dnstwist"
dnstwist $TARGET.com > "$RESULTS_DIR/dnstwist.txt"
log "Running shodan"
shodan search hostname:$TARGET.com > "$RESULTS_DIR/shodan.txt"
log "Running censys"
censys search $TARGET.com > "$RESULTS_DIR/censys.txt"

# More subdomain enumeration and validation
log "Running spiderfoot"
spiderfoot -s $TARGET.com -o "$RESULTS_DIR/spiderfoot.html"
log "Running subfinder"
subfinder -d $TARGET.com -o "$RESULTS_DIR/subfinder.txt"

# Waymore and other enumeration tools
log "Running waymore"
meg -d 1000 -v /path/to/live_subdomains.txt > "$RESULTS_DIR/waymore.txt"

# Validation and extended checks
log "Running masscan"
masscan -iL "$RESULTS_DIR/live_subdomains.txt" -p0-65535 -oX "$RESULTS_DIR/masscan.xml"
log "Running ssstrike"
ssstrike -u $TARGET.com -o "$RESULTS_DIR/ssstrike.txt"
log "Running dnsx"
dnsx -l "$RESULTS_DIR/subdomains.txt" -resp-only -o "$RESULTS_DIR/dnsx.txt"

# Collecting unique URLs
log "Running waybackpack"
waybackpack $TARGET.com -d "$RESULTS_DIR/waybackpack"
log "Running httpx"
httpx -l "$RESULTS_DIR/live_subdomains.txt" -mc 200 -title -tech-detect -o "$RESULTS_DIR/httpx.txt"

log "Reconnaissance completed on $TARGET"
