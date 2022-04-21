# Perform search on spotify
data "spotify_search_track" "search1" {
  name = "lofi"
  limit = 50
}

data "spotify_search_track" "search2" {
  name = "rock"
  limit = 50
}


# Shuffle each list of songs from data blocks above
resource "random_shuffle" "searches_shuffle" {
  input = flatten([
    data.spotify_search_track.search1.tracks[*].id,
    data.spotify_search_track.search2.tracks[*].id
  ])
}


# Create a playlist with the results of the above shuffle resources
resource "spotify_playlist" "shuffled_playlist" {
  name        = "Shuffle.tf"
  description = "Shuffled automation at its finest."
  public = true

  tracks = flatten([
    resource.random_shuffle.searches_shuffle.result

  ])
  depends_on = [
    resource.random_shuffle.searches_shuffle
  ]
}