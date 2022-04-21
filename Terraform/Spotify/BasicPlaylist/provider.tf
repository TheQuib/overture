terraform {

    required_version = ">= 0.13.0"

    required_providers {
        spotify = {
            source = "conradludgate/spotify"
            version = "0.2.7"
        }
    }
}

provider "spotify" {
    auth_server = var.auth_server
    api_key = var.spotify_api_key
    username = var.username
    token_id = var.token_id
}