# DynamicPlaylist

Creates a Spotify playlist that dynamically expands / contracts based on information given in the [credentials.auto.tfvars](credentials.auto.tfvars.example) file.


&nbsp;


# Configuration

 - Make sure you name `credentials.auto.tfvars.example` to `credentials.auto.tfvars`.
 - Add the Oauth2 API username, key, and token id
   - Information for this can be found in the [README](../README.md) one level up
 - Give the playlist a name
 - You can choose to comment out either (or both for a blank playlist) the variable `artist_list` or `search_terms`
   - The list defaults to `[]` with nothing entered for it.
   - In the [createPlaylist.tf](createPlaylist.tf) file, take note of the `count` attribute
     - Pseudocode...
       - If the list is blank, then count = 0 (don't create this resource)
     - Psudosyntax...
       - If the list is blank ? count = 0 : count = lenth of list
 - The variables `artist_search_limit` and `terms_search_limit` tell how many songs of each search you want to add (x amount for each item in lists)
 - The rest is hopefully self-explanatory


 &nbsp;


 # Files

 ## [crentials.auto.tfvars.example](credentials.auto.tfvars)

Use this as a variables template, make sure to rename it to `credentials.auto.tfvars`!

## [provider.tf](provider.tf)

Contains Terraform requirements, provider requirements, and provider configuration.

## [variables.tf](variables.tf)

Contains variable declarations, values are given from the [credentials.auto.tfvars](credentials.auto.tfvars.example) file.

 - auth_server
   - string
 - spotify_api_key
   - string
 - username
   - string
 - token_id
   - string
 - playlist_name
   - string
 - playlist_description
   - string
 - artist_list
   - list
 - search_terms
   - list
 - artist_search_limit
   - number
 - terms_search_limit
   - number
 - use_explicit
   - bool
 - make_public
   - bool

## [createPlaylist.tf](createPlaylist.tf)

Creates the Spotify playlist with the given search results from [spotifySearch.tf](spotifySearch.tf).

## [locals.tf](locals.tf)

Combines the multiple given `artist_list` and `search_terms` lists and makes decisions on if lists are blank or not.

Basically, just local variables that can be manipulated during the `apply`.

## [spotifySearch.tf](spotifySearch.tf)

Actually does the searches based on each item in the lists given from the `credentials.auto.tfvars` file.