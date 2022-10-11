# createDNSRecord.py
# By Quinn Henry

# Uses the Cloudflare API to create a DNS record

# Imports
from typing import Set
## To make API calls
import requests
## To parse json from the API
import json
## To load .env file
import os
from dotenv import load_dotenv
## To log to console
import logging

# Set default logging config
logging.basicConfig(format='%(levelname)s: %(message)s', level = logging.INFO, )


def getEnvironment():
    load_dotenv()

    api_vars = {
        'cloudflare_email': os.getenv('cloudflare_email'),
        'cloudflare_api_token': os.getenv('cloudflare_api_token'),
        'cloudflare_api_key': os.getenv('cloudflare_api_key'),
        'cloudflare_zone_id': os.getenv('cloudflare_zone_id')
    }

    return api_vars

def cloudflare_api(authVars):
    
    headers = {
        "X-Auth-Email": authVars["cloudflare_email"],
        "X-Auth-Key": authVars["cloudflare_api_key"]
    }


#######

print(' _________ .__                   .___ _____.__                        ')
print(' \_   ___ \|  |   ____  __ __  __| _// ____\  | _____ _______   ____  ')
print(' /    \  \/|  |  /  _ \|  |  \/ __ |\   __\|  | \__  \\_  __ \_/ __ \ ')
print(' \     \___|  |_(  <_> )  |  / /_/ | |  |  |  |__/ __ \|  | \/\  ___/ ')
print('  \______  /____/\____/|____/\____ | |__|  |____(____  /__|    \___  >')
print('         \/                       \/                 \/            \/ ')
print('               ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⣤⣤⣤⣄⡀⠀⠀⠀⣶⣀⣴⠀⠀⠀')
print('               ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣴⣿⣿⣿⣿⣿⣿⣿⣿⣷⡄⠀⢹⣿⣧⣤⠔⠀')
print('               ⠀⠀⠀⠀⠀⣠⣴⣶⣤⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡄⠀⠿⠿⠷⠦⠄')
print('               ⠀⠀⠀⢀⣸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⣀⡀⠀⠀⠀')
print('               ⠀⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣿⣿⣿⣷⣦⠀')
print('               ⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇')
print('               ⠸⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠃')

# Get env vars
vars = getEnvironment()

print("\n")
logging.info("Logging in as " + vars['cloudflare_email'])
logging.info("To " + vars['cloudflare_zone_id'])

# Do Cloudflare API thingys
cloudflare_api(vars)