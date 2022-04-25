# Get IDs for songs from artist names

data "spotify_search_track" "artist_search" {
    count = length(var.artist_list)
    artist = "${var.artist_list[count.index]}"
    limit = var.artist_search_limit
    explicit = var.use_explicit
}

data "spotify_search_track" "terms_search" {
    count = length(var.search_terms)
    name = "${var.search_terms[count.index]}"
    limit = var.terms_search_limit
    explicit = var.use_explicit
}

# Concat all retrieved IDs into a single list
locals {
    # Make sure data blocks are run first
    depends_on = [data.spotify_search_track.artist_search, data.spotify_search_track.terms_search]

    artist_search_found_tracks = concat(data.spotify_search_track.artist_search[*])
    artist_search_found_track_ids = flatten(local.artist_search_found_tracks[*].tracks[*].id)
    artist_search_found_track_names = flatten(local.artist_search_found_tracks[*].tracks[*].name)

    terms_search_found_tracks = concat(data.spotify_search_track.terms_search[*])
    terms_search_found_track_ids = flatten(local.terms_search_found_tracks[*].tracks[*].id)
    terms_search_found_track_names = flatten(local.terms_search_found_tracks[*].tracks[*].name)
}