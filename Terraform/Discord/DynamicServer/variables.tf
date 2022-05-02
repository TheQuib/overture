variable "discord_token" {
    type = string
    sensitive = true
    description = "Discord API token"
}

variable "server_name" {
    type = string
    description = "Name of server to create"
}

variable "server_region" {
    type = string
    description = "Geographical region to create server in"
}

variable "server_icon_file" {
    type = string
    description = "File name or path of server icon to use"
}

variable "category_name" {
    type = string
    description = "Name of category to create in server"
}

variable "create_text_channels" {
    type = bool
    description = "Whether or not to create text channels from 'text_channels' list"
}

variable "text_channels" {
    type = list
    description = "List of text channels to create under created category, if any"
}

variable "create_voice_channels" {
    type = bool
    description = "Whether or not to create voice channels from 'text_channels' list"
}

variable "voice_channels" {
    type = list
    description = "List of voice channels to create under created category, if any"
}