# Terraform - Proxmox

Set of configuration examples for Terraform Proxmox integration

***PLEASE NOTE:*** *This is not complete, and will probably not work for you (for the most part). Just tracking my progress here for my sake.*


# Getting Started


## Prepare Proxmox user and API

The CLI is required for this, as it is where you can assign specific roles to users.
 - Log into the CLI via SSH, preferably as root to ensure you have proper permissions


### Create user

 - Run the following commands to create a user:

 ```bash
 pveum role add Terraform -privs "VM.Allocate VM.Clone VM.Config.CDROM VM.Config.CPU VM.Config.Cloudinit VM.Config.Disk VM.Config.HWType VM.Config.Memory VM.Config.Network VM.Config.Options VM.Monitor VM.Audit VM.PowerMgmt Datastore.AllocateSpace Datastore.Audit"
 pveum user add terraform@pve --password <password>
 pveum aclmod / -user terraform@pve -role Terraform
 ```

### Generate API token for new user

 - Generate a token for the new user using:
   - *NOTE*: this will return two things you need for later:
     - `full-tokenid`
     - `value`

 ```bash
 pveum user token add terraform@pve terraformToken
 ```


## Set Terraform Variables

Rename the `credentials.auto.tfvars.example` to `credentials.auto.tfvars`.

Most of these variables are self explanatory, the example values `pm_api_token_id` and `pm_api_token_secret` correspond to the output from [API token generation](#generate-api-token-for-new-user).


## Prepare Terraform

 - `cd` into the directory containing the Terraform files
 - Run `terraform init` to download the Proxmox provider


## Provision VM

Modify the file `createVM.tf` to your liking.

Check your configurations with `terraform plan`, this will show you the changes (or additions) to be made.

Provision the node with `terraform apply`.


# Attributions

 - [sdhibit](https://github.com/sdhibit) from [terraform-proxmox-cloud-init-vm](https://github.com/sdhibit/terraform-proxmox-cloud-init-vm/) for extra config info.
 - [Austin Barnes](https://cinderblook.com) for showing me how the heck Terraform works.