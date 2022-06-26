# surface-scraper.py
# By Quinn Henry

# Scrapes data from CDW-G to get stock information about a certain special product
# and sends information to a discord channel.

import requests
from bs4 import BeautifulSoup
import logging

def scrape_cdwg():

    url = "https://www.cdwg.com/product/microsoft-surface-laptop-studio-14.4-core-i7-11370h-32-gb-ram-1-tb/6715267"
    page = requests.get(url)

    parser = BeautifulSoup(page.content, "html.parser")

    productRight = parser.find_all("div", class_="productRight")

    for element in productRight:
        #print(element, end="\n"*2)
        #print("\n\n")
        availability = element.find("span", class_="message availability")
        return(availability.text.strip())

scrape_data = scrape_cdwg()

if scrape_data == "In Stock":
    logging.info("""The laptop is in stock! \n
View it here: https://www.cdwg.com/product/microsoft-surface-laptop-studio-14.4-core-i7-11370h-32-gb-ram-1-tb/6715267""")
elif scrape_data == "Item Backordered":
    logging.info("""The laptop is still backordered.
No need to check it out.""")
else:
    logging.info("""Interesting
Current stock is: """ + scrape_data)