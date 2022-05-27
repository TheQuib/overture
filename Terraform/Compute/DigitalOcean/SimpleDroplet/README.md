# Terraform - DigitalOcean

Set of configuration examples for Terraform DigitalOcean integration


# Getting Started

## Create personal access token

 - Log into your DigitalOcean account
 - Head over to `Api`
 - Click `Generate New Token`
 - Select your preferred expiry
   - *Note*: It is recommended to have at least some expiry set
 - Make sure the token has `Write` ability
 - Copy the token and place it in your `credentials.auto.tfvars` file

## Generate SSH key

DigitalOcean requires the usage of SSH keys via Terraform to authenticate to created instances.

Create an ssh key (both Windows and Linux):
```bash
ssh-keygen
```

This will ask what file name to use and where to save it. Probably best to save it in the directory of your Terraform project as `id_rsa`.
 - Make sure to keep the file `id_rsa.pub` in the Terraform directory, and place the `id_rsa` file in your SSH configuration directory
   - Windows SSH directory location:
     - `%user%\.ssh`
   - Linux SSH directory location:
     - `/home/yourUserName/.ssh`