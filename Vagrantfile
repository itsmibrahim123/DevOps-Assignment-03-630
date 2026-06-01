Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/focal64"
  config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "4096"
    vb.cpus = 2
  end
  config.vm.provision "shell", inline: <<-SHELL
    apt-get update
    apt-get install -y docker.io
    usermod -aG docker vagrant

    # Install kubectl
    curl -LO "https://dl.k8s.io/release/v1.28.0/bin/linux/amd64/kubectl"
    install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

    # Install Minikube
    curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
    install minikube-linux-amd64 /usr/local/bin/minikube

    echo "VM is ready. Run 'cd /vagrant && ./start.sh' to start the application."
  SHELL
end
