resource "discord_voice_channel" "voiceChannels" {
    depends_on = [
        resource.discord_category_channel.categoryChannel
    ]
    
    count = var.create_voice_channels ? length(var.voice_channels) : 0

    name = lower(var.voice_channels[count.index])

    position = count.index + length(var.text_channels) + 1

    server_id = data.discord_server.createdServerInfo.id
    category = resource.discord_category_channel.categoryChannel.id
}