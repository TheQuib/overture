data "discord_local_image" "serverIcon" {
    file = var.server_icon_file
}



# Create a server
resource "discord_server" "my_server" {
    depends_on = [
      data.discord_local_image.serverIcon
    ]
    name = var.server_name
    region = var.server_region
    default_message_notifications = 0
    icon_data_uri = data.discord_local_image.serverIcon.data_uri
}



# Get newly created server's ID
data "discord_server" "createdServerInfo" {
    server_id = resource.discord_server.my_server.id
}