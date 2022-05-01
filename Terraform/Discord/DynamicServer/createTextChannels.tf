resource "discord_text_channel" "textChannels" {
    depends_on = [
        resource.discord_category_channel.categoryChannel
    ]
    
    count = length(var.text_channels)

    name = lower(var.text_channels[count.index])

    position = 0

    server_id = data.discord_server.createdServerInfo.id
    category = resource.discord_category_channel.categoryChannel.id
}