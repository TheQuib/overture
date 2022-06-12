# Packer/Proxmox

Packer configs for creating Proxmox images


# Getting Started


## Prepare Proxmox user and API

The CLI is required for this, as it is where you can assign specific roles to users.
 - Log into the CLI via SSH, preferably as root to ensure you have proper permissions


### Create user

 - Run the following commands to create a user:

 ```bash
 pveum role add Packer -privs "VM.Allocate VM.Clone VM.Config.CDROM VM.Config.CPU VM.Config.Cloudinit VM.Config.Disk VM.Config.HWType VM.Config.Memory VM.Config.Network VM.Config.Options VM.Console VM.Monitor VM.Audit VM.PowerMgmt Datastore.AllocateSpace Datastore.Audit"
 pveum user add packer@pve --password <password>
 pveum aclmod / -user packer@pve -role Packer
 ```

### Generate API token for new user

 - Generate a token for the new user using:
   - *NOTE*: this will return two things you need for later:
     - `full-tokenid`
     - `value`

 ```bash
 pveum user token add packer@pve packerToken
 ```


## Set Packer Variables

Rename the `credentials.pkr.hcl.example` to `credentials.pkr.hcl`.

Most of these variables are self explanatory, the example values `pm_api_token_id` and `pm_api_token_secret` correspond to the output from [API token generation](#generate-api-token-for-new-user).


## Change cloud config settins

In [http](/Proxmox/ubuntu-server-focal/http/), there is a file called `user-data.example`. Rename this to `user-data` and change all necessary items based on your location / use cases (such as time zone, keyboard layout, and password (see [next](#password-authentication)) / ssh key).

### Password authentication

If you want to use password authentication in your cloud config file, you'll need to install `whois` on a Linux machine (can be [WSL](https://docs.microsoft.com/en-us/windows/wsl/about)):

```bash
sudo apt update
sudo apt install whois
```

And generate the password:

```bash
echo yourPassword | mkpasswd -m sha-512 -s
# Output:
# $6$D1JWfDZSQnYXlN$Q27xJS9HXxN4qYjr1A.hTScqpQV6ytfQzsB3kVCN4M9EzBEJUy.KpHb3jL1yj2GF5Olg.GVhwGQqzmbp1reW/0
```



# Validate configurations

`cd` into the [project directory](/Proxmox/ubuntu-server-focal/), and run `packer validate -var-file='..\credentials.pkr.hcl' .\ubuntu-server-focal.pkr.hcl`.
 - If any errors show up, you'll have to fix them before moving on


# Build configurations

Now, to actually build the image, run `packer build -var-file='..\credentials.pkr.hcl' .\ubuntu-server-focal.pkr.hcl`.

## If an error occurs

You may find it beneficial to run with the flag `--on-error=ask`, which will ask you if you want to decide to clean up, abort, or retry the failed step for a provisioner.

You can refer to their [documentation](https://www.packer.io/docs/commands/build#on-error-cleanup) for more info on this as well.


# Attributions

 - [Tenzin](https://tlhakhan.medium.com/) from the article [Ubuntu 20.04 Server autoinstall](https://tlhakhan.medium.com/ubuntu-server-20-04-autoinstall-2e5f772b655a)
 - [Christian Lempa](https://github.com/xcad2k) from his [boilerplates repository](https://github.com/xcad2k/boilerplates/tree/main/packer), also his YouTube video [Create VMs on Proxmox in Seconds!](https://www.youtube.com/watch?v=1nf3WOEFq1Y&t=716s)