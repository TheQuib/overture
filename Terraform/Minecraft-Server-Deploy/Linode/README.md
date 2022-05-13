# Terraform/Minecraft-Server-Deploy/Linode

Terraform configs for creating a Linode instance and provisioning a Minecraft server

# Requirements

 - A Linode API Token

<br>

# Provider

This uses the [Linode Provider](https://registry.terraform.io/providers/linode/linode/1.27.2) by [Linode](https://registry.terraform.io/namespaces/linode).

<br>

# Files

## [createLinode.tf](createLinode.tf)

 - Creates a Linode instance with attributes defined in the [credentials.auto.tfvars](credentials.auto.tfvars.example) file
 - With a [remote-exec provisioner](https://www.terraform.io/language/resources/provisioners/remote-exec), Docker is installed to run the server

## [credentials.auto.tfvars.example](credentials.auto.tfvars.example)

Contains all necessary variables to be populated, with related links to resources (such as instance IDs) relevant to the variable.
 - It is necessary that you change the name from `credentials.auto.tfvars.example` to `credentials.auto.tfvars`

## [provider.tf](provider.tf)

Contains terraform version and provider version/information for the project.

## [variables.tf](variables.tf)

Contains all variable declarations that relate to [credentials.auto.tfvars](credentials.auto.tfvars.example) values.