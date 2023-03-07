# your_spotify

Configuration files for setting up the `your_spotify` Spotify stats server.

[your_spotify](https://github.com/Yooooomi/your_spotify), developed by [Timothee Boussus](https://github.com/Yooooomi)

To get started, it is best to check out the official docs on the project's [repository](https://github.com/Yooooomi/your_spotify). Included in this repo is the base `docker-compose.yml` file (for simple, local-only setups) and one for placing `your_spotify` behind a [Traefik Reverse Proxy](https://traefik.io/traefik/).


# Setup

## Docker
To spin up the containers with the minimum requirements, you can run the `compose` file in the [noTraefik](/Docker/your_spotify/noTraefik/) directory.

Running behind `Traefik` will require some tweaking, but a base for that can be found in the [traefik](/Docker/your_spotify/traefik/) directory.

## Spotify for Developers
You will need to set up a *Spotify for Developers* application to get some required keys. To do this, follow the tutorial from the original documentation [here](https://github.com/Yooooomi/your_spotify#creating-the-spotify-application).