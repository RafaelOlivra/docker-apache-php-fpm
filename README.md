# 🐳 Containerized PHP + WordPress Stack

This is a simple and powerful containerized stack for running PHP applications such as WordPress. It’s designed to be **fast**, **secure**, and **easy to manage**, with optional tools for administration and file management.

It includes by default:

-   🔐 [Caddy](https://caddyserver.com/) – Handles HTTPS automatically
-   🐬 [MariaDB](https://mariadb.org/) – Latest version for robust MySQL support
-   🐘 Apache2 with PHP `8.4-fpm` – Custom image optimized for WordPress
-   🛠️ [Adminer](https://www.adminer.org/en/) – Web-based DB access (optional)
-   📂 [TinyFileManager](https://github.com/prasathmani/tinyfilemanager) – File manager UI (optional)

---

## 📦 Services Overview

| Service       | Description                                 | Port(s)             |
| ------------- | ------------------------------------------- | ------------------- |
| `proxy`       | Caddy reverse proxy (HTTPS & static assets) | 80, 443, 2053, 2087 |
| `db`          | MariaDB database                            | Internal only       |
| `app`         | Apache2 with PHP 8.4 (custom image)         | Internal only       |
| `dbadmin`     | Adminer                                     | Internal only       |
| `filemanager` | TinyFileManager                             | Internal only       |

> ℹ️ We use these ports because they are supported by Cloudflare (https://developers.cloudflare.com/fundamentals/reference/network-ports/).

---

## 🛠️ Quick Start

1. **Clone the repository**:

    ```bash
    git clone https://github.com/your-repo/your-project.git
    cd your-project
    ```

2. **Create a `.env` file**:

    ```bash
    cp .env.example .env
    # Then edit it to match your environment
    ```

3. **Start the main stack**:

    ```bash
    docker-compose up -d
    ```

4. **(Optional) Start admin tools**:
    ```bash
    docker-compose --profile admin up -d
    ```

> ℹ️ The admin tools include Adminer and TinyFileManager. These are disabled by default using Docker Compose [profiles](https://docs.docker.com/compose/profiles/).

---

## 🔒 HTTPS by Default

Caddy automatically provisions HTTPS using Let's Encrypt or internal TLS if configured. If you're using this for local development, you can add this to the `.env`:

```env
CADDY_CONFIG_EXTRA=tls internal
CADDY_CONFIG_EXTRA_TOOLS=tls internal
```

---

## 🧩 Tips

-   Use docker-compose logs -f to monitor logs.
-   You can mount additional volumes for plugins/themes inside html/.
-   (Optional) Adminer available at: https://yourdomain.com:2053 (Behind HTTP Authentication)
-   (Optional) TinyFileManager available at: https://yourdomain.com:2087 (Behind HTTP Authentication. After authentication, please use 'admin' and 'admin@123' in the TinyFileManager login form)

---

## 📝 Notes

-   You can build your own image instead by uncommenting the `build:` section in `docker-compose.yml`.

---

## 📅 Last Updated

**07-Aug-2025**
