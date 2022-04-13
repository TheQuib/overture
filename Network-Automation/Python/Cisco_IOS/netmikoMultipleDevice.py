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
hosts = [
    '192.168.23.127'
]

for host in  hosts:
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
    #Commands to be sent to the machine
    commands = ['ip address']

    ssh = ConnectHandler(**hostConfig)

    ssh.send_config_set(commands)
