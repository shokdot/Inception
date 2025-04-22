# Inception

## Project Overview

**Inception** is a system administration and DevOps project from the 42 curriculum. The goal is to create a secure and functional web infrastructure using Docker and Docker Compose. The project must run multiple services in isolated containers, all managed from a single `docker-compose.yml` file.

This project was built and tested on **Debian-based** systems and uses **Docker** to containerize the environment.

## Architecture

The project includes the following containers:

### Mandatory Part

- **Nginx**
  A secure web server with SSL configured using self-signed certificates. Serves as a reverse proxy for WordPress.

- **WordPress**
  A full WordPress website running on PHP-FPM.

- **MariaDB**
  A MySQL-compatible database for storing WordPress data.

### Bonus Part

- **Redis**
  Used for object caching in WordPress to improve performance.

- **Adminer**
  A lightweight web-based database management tool.

- **cAdvisor**
  Google's container monitoring tool to visualize performance metrics and container usage in real-time.

- **Flask App (CV Viewer)**
  A small Flask application showcasing a personal CV, fulfilling the subject's bonus requirement of demonstrating personal work in a custom web app.

- **FTP Server**
  Enables file upload capability.

## Usage

### Requirements

- Docker
- Docker Compose
- GNU make

### Running the project

```bash
git clone https://github.com/shokdot/Inception.git
cd Inception
make
```

Alternatively, if not using `Makefile`:

```bash
cd srcs/
docker-compose up --build
```

### Access the services:

| Service      | URL/Port                                         |
| ------------ | ------------------------------------------------ |
| WordPress    | [https://localhost:443](https://localhost:443)           |
| Adminer      | [http://localhost:8080](http://localhost:8080) |
| cAdvisor     | [http://localhost:2843](http://localhost:2843)   |
| Flask CV App | [http://localhost:3000](http://localhost:3000)   |
| FTP          | ftp\://localhost (port 21)                       |

Note: Replace `localhost` with your VM’s IP if you're not using localhost.

## Security

- All services run as non-root users where possible.
- Nginx uses SSL with self-signed certificates.
- MariaDB and FTP credentials are stored in `.env` files or Docker secrets.

## Bonus Features

- Caching with Redis for WordPress.
- Container Monitoring with cAdvisor.
- Database Management via Adminer.
- Custom Web App: Flask-powered CV page.
- FTP configured with secure access control.

## Project Structure
```
inception/
├── srcs/
│   └── requirements/
│       ├── bonus/
│       │   ├── adminer/
│       │   ├── cadvisor/
│       │   ├── flask/
│       │   ├── ftp/
│       │   └── redis/
│       ├── mariadb/
│       ├── nginx/
│       └── wordpress/
├── .env_example
├── docker-compose.yml
├── en.subject.pdf
└── Makefile
```
## Notes

- The entire stack is managed with Docker Compose.
- Services restart automatically unless stopped manually.
- Clean-up with `make clean` or `docker-compose down -v`.
- Clean also volumes with `make fclean`


## Author

- [Intra Profile](https://profile.intra.42.fr/users/healeksa)


## Subject

This project follows the official Inception subject provided by 42.

