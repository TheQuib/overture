import feedparser
import re
import sys
import argparse
import os

# Argument parser setup
parser = argparse.ArgumentParser(description="Check RSS feed for keywords.")
parser.add_argument("--url", required=True, help="The RSS feed URL.")
parser.add_argument("--keywords", required=True, nargs="+", help="Keywords to search for in the RSS feed.")
parser.add_argument("--state-file", help="File to store processed URLs")
args = parser.parse_args()

# Determine the script's directory and set the default state file location
script_dir = os.path.dirname(os.path.abspath(__file__))
default_state_file = os.path.join(script_dir, "rss_seen_urls.txt")

# Use the provided state file path or default to the one in the script's directory
state_file = args.state_file if args.state_file else default_state_file

# Function to load already seen URLs
def load_seen_urls(state_file):
    if os.path.exists(state_file):
        with open(state_file, 'r') as file:
            return set(line.strip() for line in file)
    return set()

# Function to save a URL to the state file
def save_url(state_file, url):
    with open(state_file, 'a') as file:
        file.write(url + "\n")

# Function to check the RSS feed
def check_feed(feed_url, keywords, state_file):
    feed = feedparser.parse(feed_url)
    seen_urls = load_seen_urls(state_file)
    
    # Iterate over entries in reverse order to start with the newest first
    for entry in reversed(feed.entries):
        if entry.link not in seen_urls:
            if any(re.search(keyword, entry.title, re.IGNORECASE) or 
                   re.search(keyword, entry.summary, re.IGNORECASE) 
                   for keyword in keywords):
                print(entry.link)  # Print the URL of the relevant post
                save_url(state_file, entry.link)  # Save this URL as processed
                return True
    return False

# Run the feed check
if check_feed(args.url, args.keywords, state_file):
    sys.exit(0)  # RSS feed contains a new relevant post
else:
    sys.exit(1)  # No new relevant post found
