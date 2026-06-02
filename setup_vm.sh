#!/bin/bash

echo "--- Installing Dependencies (Docker, Kubectl, Minikube) ---"

# Update and install basic tools
sudo apt-get update
sudo apt-get install -y git curl docker.io

# Add user to docker group
sudo usermod -aG docker \$USER

# Install Kubectl
echo "--- Installing Kubectl ---"
curl -LO "https://dl.k8s.io/release/v1.28.0/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
rm kubectl

# Install Minikube
echo "--- Installing Minikube ---"
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
rm minikube-linux-amd64

echo "--- Dependencies Installed. Starting Application ---"

# Run the start script using the docker group
sg docker -c "chmod +x start.sh && ./start.sh"

echo ""
echo "===================================================="
echo "SETUP COMPLETE!"
echo "The application is now running inside this VM."
echo ""
echo "NEXT STEP TO GENERATE .OVA:"
echo "1. Type 'sudo shutdown now' to turn off this VM."
echo "2. On your MAC/PC, open VirtualBox."
echo "3. Right-click this VM -> Export to OVF/OVA."
echo "===================================================="
