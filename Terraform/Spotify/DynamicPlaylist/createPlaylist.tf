resource "spotify_playlist" "terraformPlaylist" {
    
    name = var.playlist_name
    description = var.playlist_description
    public = var.make_public
    
    tracks = flatten([
        local.artist_search_found_track_ids,
        local.terms_search_found_track_ids
    ])
}