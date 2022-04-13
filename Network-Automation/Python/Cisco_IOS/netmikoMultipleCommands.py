#Network automation module 
from netmiko import ConnectHandler
#Module used to hide passwords in the console
import getpass

#Ask user for username
username = input("Please enter a username to connect with:\n")
#Ask user for password using getpass
password = getpass.getpass("Please enter a password to connect with:\n")
#Ask user for secret password
secret = getpass.getpass("Please enter a secret password to enable with:\n")

#Defined host IP address, make sure this matches your linux machine
host = '192.168.23.139'

#Configuration dictionary that netmiko will use
hostConfig = {
    'device_type': 'cisco_ios',
    'host': host,
    'username': username,
    'password': password,
    #Used for exec priv commands if necessary
    'secret': password,
    #Accept unknown SSH keys
    'use_keys': True
}

ssh = ConnectHandler(**hostConfig)

config = ['int gi0/1', 'ip address 172.16.0.1 255.255.0.0']

ssh.send_config_set(config)