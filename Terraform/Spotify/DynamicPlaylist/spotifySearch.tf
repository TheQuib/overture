# Get IDs for songs from artist names

data "spotify_search_track" "artist_search" {
    count = local.do_artist_search ? length(var.artist_list) : 0
    artist = var.artist_list[count.index]
    limit = var.artist_search_limit
    explicit = var.use_explicit
}

data "spotify_search_track" "terms_search" {
    count = local.do_terms_search ? length(var.search_terms) : 0
    name = var.search_terms[count.index]
    limit = var.terms_search_limit
    explicit = var.use_explicit
}