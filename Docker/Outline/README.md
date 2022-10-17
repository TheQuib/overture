# Outline

Markdown-based knowledge base, known for being very difficult to get set up, now made easy! In this example, this will be deployed behind Traefik.

Check out [their website](https://www.getoutline.com/).


## Generate two secret keys

```bash
openssl rand -hex 32
openssl rand -hex 32
```

## Update .env file

- Change the name of `.env.example` to `.env`
- Update `SECRET_KEY` and `UTILS_SECRET` with the random strings generated above

## Prepare Docker

### Create volumes and network

```bash
docker volume create storage-data
docker volume create db-data
docker network create outline-net
```

## Create database

```bash
docker compose run --rm outline yarn db:create --env=production-ssl-disabled
```

## Migrate database to add needed tables, indexes, etc

```bash
docker compose run --rm outline yarn db:migrate --env=production-ssl-disabled
```


## Run stack

```bash
docker compose up -d
```


## Side notes

 - The `outline` container only works via reverse proxy if proxied via port `3000` from the container.
   - If using a reverse proxy with this port, ensure the `PORT` variable in the `.env` file is `3000` and do not specify a port in the `URL` variable
 - Ports `80` and `443` should only be used if generating a self-signed cert / uploading your own trusted cert
   - Make sure to set the `PORT` variable in the `.env` file to `443` to ensure all services are accessing Outline via that port