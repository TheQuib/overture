#Create a category channel in the new server
resource "discord_category_channel" "general" {
    depends_on = [
      data.discord_server.createdServerInfo
    ]
    name = var.category_name
    position = 0
    server_id = data.discord_server.createdServerInfo.id
}