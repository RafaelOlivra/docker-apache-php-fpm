# A simple Docker Image for Containerized PHP Applications

It includes by default **Nginx Proxy Manager / Mariadb Latest / phpMyAdmin / Customized php:8.2-apache **.  
I made this because, while there are more "modern" approaches to run a WordPress container with reverse proxy via "Caddy" or "NGINX", a lot of plugins still relies on custom .htaccess rules to work (301 Redirection Plugins, Webp Converter for Media, etc..), so is easier to just roll with what works best.  
For smaller sites, as long as you have an optimized theme and a good caching plugin, the performance difference between the apache server and the reverse proxy solutions is almost insignificant.

## Usage
Clone the repo, create an .env file using the provided .env.example file as example (Use strong passwords!).
Then run:
```
docker-compose up --build
```
After everything is online go your domain:7001 and create your admin credentials (Default: admin@example.com/changeme).
Add a new proxy with your domain name / Scheme: http / Forward Hostname: app / Forward Port: 80. You can check https://nginxproxymanager.com/guide/#quick-setup for more options.

That's it, your site should now be accessible.

