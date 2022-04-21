resource "spotify_playlist" "playlist" {
  name        = ".tf"
  description = "Automation at its finest."
  public = true

  tracks = flatten([
    data.spotify_search_track.search.tracks[*].id
  ])
  depends_on = [
    data.spotify_search_track.search
  ]
}

data "spotify_search_track" "search" {
  name = "lofi"
  limit = 50
}