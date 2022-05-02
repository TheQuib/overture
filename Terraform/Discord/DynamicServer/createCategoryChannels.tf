resource "discord_category_channel" "defaultCategory" {
    depends_on = [
      data.discord_server.createdServerInfo
    ]
    name = "General"
    position = 0
    server_id = data.discord_server.createdServerInfo.id
}

resource "discord_category_channel" "categoryChannel" {
    depends_on = [
      data.discord_server.createdServerInfo
    ]
    name = var.category_name
    position = 1
    server_id = data.discord_server.createdServerInfo.id
}