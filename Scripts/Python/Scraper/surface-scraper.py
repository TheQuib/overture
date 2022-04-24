# surface-scraper.py
# By Quinn Henry

# Scrapes data from CDW-G to get stock information about a certain special product
# and sends information to a discord channel.

import requests
from bs4 import BeautifulSoup
from dhooks import Webhook

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

hook_url = "https://discord.com/api/webhooks/941412446919352410/A7AJ7QKiByvKZ6NQrUtjaFLgwFoS0Z_3vDAzxuV4ewDptmXjooBIEPmOHI-dP9sSN-qu"
hook = Webhook(hook_url)

if scrape_data == "In Stock":
    hook.send(""":tada: The laptop is in stock! :tada:\n
View it here: https://www.cdwg.com/product/microsoft-surface-laptop-studio-14.4-core-i7-11370h-32-gb-ram-1-tb/6715267""")
elif scrape_data == "Item Backordered":
    hook.send(""":cry: The laptop is still backordered.
No need to check it out.""")
else:
    hook.send("""Interesting :thinking:
Current stock is: """ + scrape_data)