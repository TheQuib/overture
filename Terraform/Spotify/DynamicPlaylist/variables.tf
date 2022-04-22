# API variables

variable "auth_server" {
    type = string
    description = "OAuth proxy server URL"
}

variable "spotify_api_key" {
    type = string
    description = "OAuth proxy API key"
}

variable "username" {
    type = string
    description = "OAuth proxy username"
}

variable "token_id" {
    type = string
    description = "OAuth proxy token ID (found at top)"
}


# Playlist variables

variable "playlist_name" {
    type = string
    description = "Name of new playlist"
}

variable "playlist_description" {
    type = string
    description = "Description of new playlist"
}

variable "artist_list" {
    type = list
    description = "List of artists to add to playlist"
}

variable "search_terms" {
    type = list
    description = "List of search terms to add songs with"
}

variable "artist_search_limit" {
    type = number
    description = "Number of songs to pull from artist search"
}

variable "terms_search_limit" {
    type = number
    description = "Number of songs to pull from terms search"
}

variable "use_explicit" {
    type = bool
    description = "Allow for explicit songs"
}

variable "make_public" {
    type = bool
    description = "Make playlist public or not"
}