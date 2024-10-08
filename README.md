# 🚀 [Dockerized FastAPI](https://github.com/chandan07cse/fastapi-docker) - The Boilerplate

This repository contains a FastAPI application that is fully Dockerized for local development and automatic deployment using **Docker Compose** and **GitHub Actions**.

## 📖 Table of Contents
1. [Features](#-features)
2. [Technologies](#-technologies)
3. [Local Installation](#-local-installation)
4. [Deployment](#-deployment)
5. [Available Commands](#-available-commands)
6. [Project Structure](#-project-structure)
7. [Contributing](#-contributing)
8. [License](#-license)

---

## ✨ Features
- **FastAPI** backend with automatic documentation (Swagger, ReDoc).
- **Docker Compose** setup for easy local development.
- **Caddy** as a reverse proxy for production deployment.
- **GitHub Actions** for Continuous Deployment to an EC2 instance.
- Automatic HTTPS certificate generation and renewal (via Caddy).

---

## 🛠 Technologies
- **FastAPI**: Modern, fast (high-performance) web framework for building APIs with Python 3.7+ based on standard Python type hints.
- **Docker & Docker Compose**: Containerization and orchestration tools for running and managing microservices.
- **Caddy**: Powerful, automatic HTTPS-enabled web server to serve the FastAPI app.
- **GitHub Actions**: Automated deployment pipeline.

---

## 🏃‍♂️ Local Installation

Follow these steps to get the application running locally.

### 1. **Install Docker**

First, make sure Docker is installed on your system. You can follow the official guide to install Docker on Ubuntu:

🔗 [Docker Installation Guide for Ubuntu](https://docs.docker.com/engine/install/ubuntu/)

### 2. **Clone the Repository**

Open your terminal and clone the repository:

```bash
git clone https://github.com/chandan07cse/fastapi-docker.git
cd fastapi-docker
```

### 3. **Run the Application**

Run the following command to build and start the Docker containers:

```bash
sudo docker-compose -f docker-compose.dev.yml up -d --build --remove-orphans
```
docker-compose.dev.yml is used for local development and will expose the app on http://localhost:8000

### 4. **Access the Application**

Once the containers are up and running, open your browser and go to:

http://localhost:8000


You should see the FastAPI documentation page (Swagger UI) where you can interact with your API.

#### API Endpoints

- **Swagger UI**: Access the interactive API documentation at [http://localhost:8000/docs](http://localhost:8000/docs).
- **ReDoc**: For an alternative API documentation view, visit [http://localhost:8000/redoc](http://localhost:8000/redoc).

You can use these interfaces to test your API endpoints, view request and response schemas, and explore the available functionalities of your FastAPI application.

### Troubleshooting

If you encounter any issues accessing the application:
- Ensure that Docker is running and the containers are up with `sudo docker ps`.
- Check the logs for any errors using:
  
  ```bash
  sudo docker-compose -f docker-compose.dev.yml logs
  ```
## 🚀 Deployment

The application is configured for automatic deployment using **GitHub Actions**.

### 1. **Push to GitHub**

Simply push your code to the `master` branch, and it will trigger an automatic deployment process that uses Docker Compose on your remote server.

### 2. **Deployment Process**

When you push to the `master` branch, the following steps occur:

- **Build**: GitHub Actions will build the Docker images based on your Dockerfile(s).
- **Deploy**: It will SSH into your EC2 instance and pull the latest code from your repository.
- **Restart Containers**: The application containers will be restarted using Docker Compose to reflect the latest changes.

### 3. **Environment Variables**

Ensure that your EC2 instance has the required environment variables set up for the FastAPI application. You can manage these through the GitHub Secrets to keep sensitive information safe.

### 4. **Caddy Configuration**

Caddy will automatically handle reverse proxying and TLS certificate management. The configuration is defined in the `Caddyfile`, ensuring that your application is securely accessible over HTTPS.

### Note

- The deployment process is currently set to trigger on changes to the `master` branch only. You can modify the GitHub Actions workflow file if you want to deploy from other branches.
- Monitor the GitHub Actions logs for any errors during deployment. If there are issues, you can check the logs of your Docker containers for troubleshooting:

  ```bash
  sudo docker-compose -f docker-compose.prod.yml logs
  ```
## 🔧 Available Commands

Here are some useful Docker commands for managing your containers:

### 1. **Check Docker Containers**

To see a list of running containers, use:

  ```bash
  sudo docker ps -a
  ```
### 2. **Access a Running Container**

If you need to access a running container for debugging or other purposes, use the following command to open a shell inside the container:

  ```bash
  sudo docker exec -it <container-id> sh
  ```
### 4. **Remove Unused Images**

Over time, your Docker environment may accumulate unused images that take up disk space. You can clean up these images using the following command:

  ```bash
  sudo docker image prune
  ```
### 5. **Remove Unused Containers**

Over time, your Docker environment may accumulate unused containers that take up disk space. You can clean up these containers using the following command:

  ```bash
  sudo docker container prune
  ```

## 🌟 Contributing

Contributions are welcome! Here’s how you can contribute to this project:

1. **Fork the Repository**: Click the "Fork" button at the top right of the repository page to create your own copy of the project.
   
2. **Clone Your Fork**: Clone the forked repository to your local machine:

  ```bash
   git clone https://github.com/your-username/fastapi-docker.git
  ```