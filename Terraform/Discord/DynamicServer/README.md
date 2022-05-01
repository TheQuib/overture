# DynamicServer

Creates a Discord server that dynamically expands / contracts based on information given in the [credentials.auto.tfvars](credentials.auto.tfvars.example) file.


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
 - `text_channels`
   - list
 - `create_voice_channels`
   - bool
 - `voice_channels`
   - list


## [createServer.tf](createServer.tf)

Creates a Discord server with a given picture as its icon ([serverIcon.png](serverIcon.png)).

## [createCategoryChannel.tf](createCategoryChannel.tf)

Creates a category to place channels under (at least one of these is required).

## [createTextChannels.tf](createTextChannel.tf)

Creates text channels that fall under the created [category](createCategoryChannel.tf) using the `text_channels` variable.

## [createVoiceChannels.tf](createVoiceChannels.tf)

Creates voice channels that fall under the created [category](createCategoryChannel.tf) using the `voice_channels` variable.
 - This is only done if the `create_voice_channels` variable is set to `true`

## [createServerInvite.tf](createServerInvite.tf)

Creates a server invite, returning the invide code that can be used to join the server.

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