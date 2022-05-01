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

variable "text_channel_name" {
    type = string
    description = "Name of text channel to create under created category"
}

variable "message_text" {
    type = string
    description = "Text to send in a message in created channel"
}

variable "pin_message" {
    type = bool
    description = "Whether or not to pin the sent message"
}