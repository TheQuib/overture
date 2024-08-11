# rss_check.py

import feedparser
import re
import sys
import argparse

def check_feed(feed_url, keywords):
    feed = feedparser.parse(feed_url)
    for entry in feed.entries:
        if any(re.search(keyword, entry.title, re.IGNORECASE) or 
               re.search(keyword, entry.summary, re.IGNORECASE) 
               for keyword in keywords):
            return True
    return False

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Check RSS feed for keywords.")
    parser.add_argument("--url", required=True, help="The RSS feed URL.")
    parser.add_argument("--keywords", required=True, nargs="+", help="Keywords to search for in the RSS feed.")
    args = parser.parse_args()

    if check_feed(args.url, args.keywords):
        sys.exit(0)  # RSS feed contains relevant post
    else:
        sys.exit(1)  # No relevant post found
