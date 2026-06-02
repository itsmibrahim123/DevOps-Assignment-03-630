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
We have automated the VM creation and export process.

### Automated Export & Git Push:
Run this script on your **host machine** (Mac/Windows) with VirtualBox and Vagrant installed:
```bash
chmod +x export_ova.sh
./export_ova.sh
```
This script will:
1. `vagrant up` (Build the VM).
2. Run `./start.sh` inside the VM.
3. `vagrant halt` (Shut down the VM).
4. `vboxmanage export` (Create `assignment-3.ova`).
5. `git push` (Upload the .ova to GitHub).

**Note:** If your `.ova` is larger than 100MB, ensure you have **Git LFS** installed (`brew install git-lfs`).

### Manual Export:
1. Build the VM: `vagrant up`
2. Open **VirtualBox GUI**.
3. Select `DevOps-Assignment-3`.
4. Go to **File > Export Appliance**.
5. Save as `assignment-3.ova`.

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
