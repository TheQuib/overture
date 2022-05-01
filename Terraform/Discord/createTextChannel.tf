# Create a text channel in the new server
resource "discord_text_channel" "general" {
    depends_on = [
      resource.discord_category_channel.general
    ]
    name = lower(var.text_channel_name)
    position = 0
    server_id = data.discord_server.createdServerInfo.id
    category = resource.discord_category_channel.general.id
}