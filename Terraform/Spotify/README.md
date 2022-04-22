# terraform/spotify

Collection of Terraform configurations that create spotify playlists


## [BasicPlaylist](/Terraform/Spotify/BasicPlaylist/)

Creates a basic playlist, with a single song name search (default is "lofi"), and creates a playlist with 50 songs

This uses the [Spotify Provider](https://registry.terraform.io/providers/conradludgate/spotify/latest) by [Conrad Ludgate](https://github.com/conradludgate).


## [DynamicPlaylist](/Terraform/Spotify/DynamicPlaylist/)

Creates a playlist that dynamically expands and contracts, and adjusts settings based solely on variables. No extra changes needed.

This uses a combination of the [Spotify Provider](https://registry.terraform.io/providers/conradludgate/spotify/latest) by [Conrad Ludgate](https://github.com/conradludgate) and the [Random Provider](https://registry.terraform.io/providers/hashicorp/random/latest) by [HashiCorp](https://registry.terraform.io/namespaces/hashicorp).


## [ShuffledPlaylist](/Terraform/Spotify/ShuffledPlaylist/)

Creates a shuffled playlist, with 2 song name searches (default of "lofi" and "rock"), combines the two searches and shuffles them.

This uses a combination of the [Spotify Provider](https://registry.terraform.io/providers/conradludgate/spotify/latest) by [Conrad Ludgate](https://github.com/conradludgate) and the [Random Provider](https://registry.terraform.io/providers/hashicorp/random/latest) by [HashiCorp](https://registry.terraform.io/namespaces/hashicorp).


# Set up Oauth2 Proxy

You can use a self-hosted or public form of this:

## Self Hosted

 - Refer to [HashiCorp's Aricle](https://learn.hashicorp.com/tutorials/terraform/spotify-playlist#create-spotify-developer-app) and the [proxy's repository](https://github.com/conradludgate/oauth2-proxy) to learn how to set this up

## Public Hosted

[You can find these steps here as well](https://github.com/conradludgate/oauth2-proxy#how-it-works)

 - Go to [https://oauth2.conrad.cafe/register](https://oauth2.conrad.cafe/register) and register for an account
 - Choose the token type you want to create (spotify)
 - Give the token a name, and select *at least* the following scopes:
   - user-read-email
   - user-read-private
   - playlist-read-private
   - playlist-modify-private
   - playlist-modify-public
   - user-library-read
   - user-library-modify


# Usage

 - Set your proxy variables, and any other necessary variables
 - Clone this repo, or copy the files, and `cd` into the directory you want to create a playlist from
 - Change any searches if you want
 - Run `terraform init` to download the required provider files
 - Run `terraform plan` to create your playlist!