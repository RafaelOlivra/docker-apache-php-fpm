# A simple Docker Image for Containerized PHP Applications

It includes by default **Nginx Proxy Manager / Mariadb Latest / phpMyAdmin / Customized php:8.2-apache **.  
I made this because I wanted a fast and simple way to deploy a performant WordPress site.

## Usage
Clone the repo, create an .env file using the provided .env.example file as example (Use strong passwords!).
Then run:
```
docker-compose up --build
```
After everything is online go your domain:7001 and create your admin credentials (Default: admin@example.com/changeme).
Add a new proxy with the details:

```
Domain names: your domain
Scheme: http
Forward Hostname: app
Forward Port: 443
```
You can check https://nginxproxymanager.com/guide/#quick-setup for more options.

That's it" Your site should now be accessible. I'll add more details later on how to set-up WordPress.

