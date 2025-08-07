# 🐳 Containerized PHP + WordPress Stack

This is a simple and powerful containerized stack for running PHP applications such as WordPress. It’s designed to be **fast**, **secure**, and **easy to manage**, with optional tools for administration and file management.

It includes by default:

-   🔐 [Caddy](https://caddyserver.com/) – Handles HTTPS automatically
-   🐬 [MariaDB](https://mariadb.org/) – Latest version for robust MySQL support
-   🐘 Apache2 with PHP `8.4-fpm` – Custom image optimized for WordPress
-   📂 [Tiny File Manager](https://github.com/prasathmani/tinyfilemanager) – File manager UI (optional)
-   🛠️ [Adminer](https://www.Adminer.net/) – Web-based DB access (optional)

---

## 📦 Services Overview

| Service | Description                                 | Port(s)       |
| ------- | ------------------------------------------- | ------------- |
| `proxy` | Caddy reverse proxy (HTTPS & static assets) | 80, 443       |
| `db`    | MariaDB database                            | Internal only |
| `app`   | Apache2 with PHP 8.4 (custom image)         | Internal only |

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

> ℹ️ The admin tools include Tiny File Manager and Adminer. These are disabled by default using Docker Compose [profiles](https://docs.docker.com/compose/profiles/).

---

## 🔒 HTTPS by Default

Caddy automatically provisions HTTPS using Let's Encrypt or internal TLS if configured. If you're using this for local development, you can add this to the `.env`:

```env
CADDY_CONFIG_EXTRA=tls internal
```

---

## 🧩 Tips

-   Use docker-compose logs -f to monitor logs.
-   You can mount additional volumes for plugins/themes inside html/.
-   (Optional) Adminer available at: https://yourdomain.com/.adm/dbadmin/
-   (Optional) Tiny File Manager available at: https://yourdomain.com/.adm/filemanager/
-   The admin tools are mounted as a shared volume, and are only accessible through the app container. The admin_tools sole purpose is to populate the shared volume with the necessary files.

---

## 📝 Notes

-   You can build your own image instead by uncommenting the `build:` section in `docker-compose.yml`.

---

## 📅 Last Updated

**07-Aug-2025**
