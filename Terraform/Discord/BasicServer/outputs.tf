# Print created Server details
output "server_name" {
    value = resource.discord_server.my_server.name
}
output "server_id" {
    value = resource.discord_server.my_server.id
}


# Print invite info
output "invite_info" {
    value = resource.discord_invite.inviteMe.id
}