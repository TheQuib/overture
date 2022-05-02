locals {
    # Make sure data blocks are run first
    depends_on = [
        data.spotify_search_track.artist_search, data.spotify_search_track.terms_search
    ]

    # Test if artist search contains information
    do_artist_search = length(var.artist_list) == 0 ? false : true
    # Test if terms search contains information
    do_terms_search = length(var.search_terms) == 0 ? false : true

    # Make lists into one
    artist_search_found_tracks = concat(data.spotify_search_track.artist_search[*])
    artist_search_found_track_ids = flatten(local.artist_search_found_tracks[*].tracks[*].id)
    artist_search_found_track_names = flatten(local.artist_search_found_tracks[*].tracks[*].name)

    terms_search_found_tracks = concat(data.spotify_search_track.terms_search[*])
    terms_search_found_track_ids = flatten(local.terms_search_found_tracks[*].tracks[*].id)
    terms_search_found_track_names = flatten(local.terms_search_found_tracks[*].tracks[*].name)
}