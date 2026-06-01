# Assignment 3 - DevOps

This repository contains the implementation for Assignment 3, covering Repository Management, Docker, and Orchestration.

## 📂 Project Structure
- `app/`: Contains the full Dockerized application.
  - `nginx/`: Nginx configuration and Dockerfile.
  - `flask-api/`: Flask API source code and Dockerfile.
  - `docker-compose.yml`: Multi-container orchestration.
- `src/`: Initial project structure.
- `docs/`: Additional documentation.

## 🚀 Tasks B1-B4: Docker Implementation
The application is fully containerized using Docker and orchestrated with Docker Compose.

## 📦 Task B5: Virtual Machine (.ova) Generation
To generate an `.ova` file for submission, we use **Vagrant** to ensure the environment is reproducible.

### 1. Build the VM Locally:
```bash
vagrant up
```

### 2. Export to .ova:
1. Open **VirtualBox**.
2. Select the running/stopped instance (usually named something like `assignment-3_default_...`).
3. Go to **File > Export Appliance**.
4. Save the file as `assignment-3.ova`.

## 🛠️ Usage
### Docker Compose
```bash
cd app
docker compose up -d
```

### Kubernetes (Minikube)
```bash
chmod +x start.sh
./start.sh
```

## 📜 License
MIT
