resource "discord_text_channel" "general" {
    depends_on = [
        resource.discord_category_channel.categoryChannel
    ]
    
    name = "general"

    position = 0

    server_id = data.discord_server.createdServerInfo.id
    category = resource.discord_category_channel.defaultCategory.id
}

resource "discord_text_channel" "textChannels" {
    depends_on = [
        resource.discord_category_channel.categoryChannel
    ]
    
    count = var.create_text_channels ? length(var.text_channels) : 0

    name = lower(var.text_channels[count.index])

    position = count.index + 1

    server_id = data.discord_server.createdServerInfo.id
    category = resource.discord_category_channel.categoryChannel.id
}