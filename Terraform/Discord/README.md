# Terraform/Discord

A few Terraform configs to create and manage Discord servers.

<br>

# Requirements

 - A Discord API token
   - This app uses the Discord API, which you will need to create a token for
   - Don't know how to get a token? [Click Here](#get-discord-api-token)

<br>

# Provider

The provider used here is [discord](https://registry.terraform.io/providers/Chaotic-Logic/discord/latest) by [Chaotic Logic](https://registry.terraform.io/namespaces/Chaotic-Logic) ([Source](https://github.com/Chaotic-Logic/terraform-provider-discord)).

<br>

# Files

## [crentials.auto.tfvars.example](credentials.auto.tfvars)

Use this as a variables template, make sure to rename it to `credentials.auto.tfvars`!

## [provider.tf](provider.tf)

Contains Terraform requirements, provider requirements, and provider configuration.

## [variables.tf](variables.tf)

Contains variable declarations, values are given from the [credentials.auto.tfvars](credentials.auto.tfvars.example) file.

Current variables (refer to [variables.tf](variables.tf) for descriptions):
 - `discord_token`
   - string
   - sensitive
 - `server_name`
   - string
 - `server_region`
   - string
 - `server_icon_file`
   - string
 - `server_region`
   - string
 - `category_name`
   - string
 - `text_channel_name`
   - string
 - `message_text`
   - string
 - `pin_message`
   - bool


## [createServer.tf](createServer.tf)

Creates a Discord server with a given picture as its icon ([serverIcon.png](serverIcon.png)).

## [createCategoryChannel.tf](createCategoryChannel.tf)

Creates a category to place channels under (at least one of these is required).

## [createTextChannel.tf](createTextChannel.tf)

Creates a text channel that falls under the created [category](createCategoryChannel.tf).

## [createServerInvite.tf](createServerInvite.tf)

Creates a server invite, returning the invide code that can be used to join the server.

## [sendMessage.tf](sendMessage.tf)

Sends a message in the newly created server from [createServer.tf](createServer.tf).

## [outputs.tf](outputs.tf)

Outputs various details of each resource.

Current outputs:
 - `server_id`
   - String
   - Created server Discord ID
 - `server_name`
   - String
   - Created server name
 - `invite_info`
   - String
   - Invite code to join server with

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