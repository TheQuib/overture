resource "discord_message" "hiya" {
    content = var.message_text
    pinned = var.pin_message
    channel_id = resource.discord_text_channel.general.id
}