#text_channels = [for text_channel in var.text_channels: replace(text_channel, " ", "-")]


#output "fixed_text_channels" {
#    value = [
#        for text_channel in var.text_channels: replace(
#            text_channel,
#            " ",
#            "-"
#        )
#    ]
#}