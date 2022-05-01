# Terraform/Discord

A few Terraform configs to create and manage Discord servers.

<br>

# Requirements

 - A Discord API token
   - This provider uses the Discord API, which you will need to create a token for
   - Don't know how to get a token? [Click Here](#get-discord-api-token)

<br>

# Provider

The provider used here is [discord](https://registry.terraform.io/providers/Chaotic-Logic/discord/latest) by [Chaotic Logic](https://registry.terraform.io/namespaces/Chaotic-Logic) ([Source](https://github.com/Chaotic-Logic/terraform-provider-discord)).

<br>

# Get Discord API Token

 - Head over to the [Discord Developer Portal](https://discord.com/developers/)
 - Get logged in
 - Create a new application
 - Name this whatever you want
   - Ex: "Terraform"
 - Once in your new application, head over to the "Bot" section
 - Click "Add Bot"
 - Give the bot a name (or leave the default name)
   - Ex: "Mr. Terraform"
 - Click the "Reset Token" button
   - This will give you your token, and is the only time it will be displayed
   - Make sure you keep this in a safe place, and treat it like a password
 - Use this token in your [credentials.auto.tfvars](credentials.auto.tfvars.example) file