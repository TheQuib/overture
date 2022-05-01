# Create server invite
resource "discord_invite" "inviteMe" {
    channel_id = resource.discord_text_channel.textChannels[0].id
    max_age = 0
}