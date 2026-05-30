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

### Deliverables for B2 & B3:
For detailed verification steps and proof of inter-container communication and data persistence, please refer to:
👉 **[app/DEMONSTRATION.md](app/DEMONSTRATION.md)**

## 🛠️ Usage
```bash
cd app
docker compose up -d
```

## 📜 License
MIT
