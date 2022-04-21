# terraform/spotify

Collection of Terraform configurations that create spotify playlists


## [BasicPlaylist](/Terraform/Spotify/BasicPlaylist/)

Creates a basic playlist, with a single song name search (default is "lofi"), and creates a playlist with 50 songs

This uses the [Spotify Provider](https://registry.terraform.io/providers/conradludgate/spotify/latest) by [Conrad Ludgate](https://github.com/conradludgate).


## [ShuffledPlaylist](/Terraform/Spotify/ShuffledPlaylist/)

Creates a shuffled playlist, with 2 song name searches (default of "lofi" and "rock"), combines the two searches and shuffles them.

This uses a combination of the [Spotify Provider](https://registry.terraform.io/providers/conradludgate/spotify/latest) by [Conrad Ludgate](https://github.com/conradludgate) and the [Random Provider](https://registry.terraform.io/providers/hashicorp/random/latest) by [HashiCorp](https://registry.terraform.io/namespaces/hashicorp).


# Usage

 - Clone this repo, or copy the files, and `cd` into the directory you want to create a playlist from
 - Change any searches if you want
 - Run `terraform init` to download the required provider files
 - Run `terraform plan` to create your playlist!