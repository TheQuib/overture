# getHostList.py
# By Quinn Henry

# Uses the Traefik API to gather hosts and return a list of hostnames

from typing import Set
# Import requests library for API calls
import requests
# Import json library to parse json from the API
import json
# Import argument parser
import argparse

def getArgs():
    # Initialize parser
    parser = argparse.ArgumentParser(description="Uses Traefik API to gather current host data and put them in a list")

    # Help Prompts
    traefikEndpointPrompt = "Set Traefik endpoint URL WITHOUT https://"

    # Add arguments
    parser.add_argument("-e", "--Endpoint", help = traefikEndpointPrompt, required=True)

    argValues = parser.parse_args()

    return argValues

def getHostList(traefik_endpoint):
    # Get hosts from API
    getHosts = requests.get(
        'https://' + traefik_endpoint + '/api/http/routers'
    )
    # Set hosts variable to include text output from API
    hosts = json.loads(getHosts.text)
    
    fullHostList = []
    hostList = []

    # Append each item in hosts to a list
    for host in range(len(hosts)):
        outputHost = hosts[host]['rule']
        fullHostList.append(outputHost)

    # Remove duplicates by converting list to set and back to list
    fullHostList = list(set(fullHostList))
    # Remove any item containing Regex string for error pages
    try:
        fullHostList.remove("HostRegexp(`{host:.+}`)")
    # Do nothing if item isn't found
    except Exception:
        pass

    for host in fullHostList:
        hostList.append(host[6:-2])

    return hostList


# Get arguments from command line
args = getArgs()
# Set endpoint variable from args
traefik_endpoint = args.Endpoint

# Calls API to get hosts
allHosts = getHostList(traefik_endpoint)
# Print list of hosts
print(allHosts)