# Cloudflare Tunnels
Setup Cloudflare Tunnels to your liking all in one go with Terraform!

# Requirements
 - Terraform Cloud account
   - Cloud agent set up
 - Proxmox Virtual Environment
 - Cloudflare Account
 - GitHub account

# Prepare environment
## Terraform Cloud

## Proxmox
Proxmox API calls are made with an API token that is attached to a user so a name can be assigned to actions made in Proxmox. So, we will need to create a user, an API token that is attached to that user, and assign permissions to the token

  - To get started, log into your Proxmox environment

### [Optional] Create custom Proxmox role
This is only necessary if you want to assign the least amount of permissions possible.
 - Click `Datacenter`
 - Scroll down under `Permissions` > `Roles`
 - Click `Create`
 - Give it a name (Such as `Terraform`)
 - Under privileges, select the following:
     - `VM.Config.CDROM`
     - `VM.Config.Option`
     - `VM.Config.Disk`
     - `VM.Config.HWType`
     - `VM.Console`
     - `VM.Config.Network`
     - `VM.Config.Cloudinit`
     - `VM.PowerMgmt`
     - `VM.Clone`
     - `Datastore.AllocateSpace`
     - `VM.Config.CPU`
     - `VM.Audit`
     - `VM.Allocate`
     - `Datastore.Audit`
     - `VM.Monitor`
     - `VM.Config.Memory`

### Create auth user
 - Click `Datacenter`
 - Scroll down under `Permissions` > `Users`
 - Click `Add`
 - Give it a friendly name (Such as *Terraform*)
   - *Terraform* will be used for the purposes of this tutorial

### Create API Token
 - Under `Permissions` > `API Tokens`
 - Click `Add`
 - Select the newly created user from the dropdown
 - Give the token a name, such as *terraformToken*
   - *terraformToken* will be used for the purposes of this tutorial
 - Click `Add`

### Assign permissions to the Token
 - Under `Permissions`
 - Click `Add` > `API Token Permission`
 - Apply the following settings:
   - `Path`: `/`
   - `API Token`: `terraform@pve!terraformToken`
   - `Role`: `PVEAdmin`
 - Click `Add`
 - Make sure you save the `Token ID` and `Secret` for later
   - **Note**: The `Secret` will only show once. If you lose it, you will have to recreate the Token

## Cloudflare
We will need to generate a Cloudflare API Token so Terraform can provision the necessary objects.

### Create API Token
 - Log into the Cloudflare dashboard
 - On the top-right, click the *user* icon
 - Click `My Profile`
 - On the left, click `API Tokens`
 - Click `Create Token`
 - Scroll down, click `Get started` next to *Create Custom Token*
   - Give the token a friendly name, such as *terraform*
   - Under *Permissions*, we'll just need a single permission:
     - Dropdown 1: `Account`
     - Dropdown 2: `Cloudflare Tunnel`
     - Dropdown 3: `Edit`
   - Under *Account Resources*
     - Dropdown 1: `Include`
     - Dropdown 2: *select the account you will be creating the tunnels on*
   - Under *Client IP Address Filtering*
     - Leave this blank unless you would like to filter addresses to access from
  - Click `Continue to summary`
  - Click `Create Token`
  - Make sure to save this token for later
    - **Note**: This token will only show once. If you lose it, you will have to recreate the token
  
### Get account ID
  - Log into the Cloudflare dashboard
  - Click on any website you own
  - On the right pane, scroll down until you see *Account ID*
  - Make sure to save the value of this for later


## GitHub