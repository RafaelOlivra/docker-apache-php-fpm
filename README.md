# A simple Docker Image for Containerized PHP Applications

It includes by default:

```
Caddy
Mariadb Latest
phpMyAdmin (Not started by default)
Customized php:8.2-fpm with Apache2 (Better compatibility with WordPress)
```

I made this because I wanted a fast and simple way to deploy a performant WordPress site.

## Usage

Clone the repo, create an .env file using the provided .env.example file as example (Use strong passwords!).
Then run:

```
docker-compose up --build
```

That's it" Your site should now be accessible via HTTPS. I'll add more details later on how to set-up WordPress.
