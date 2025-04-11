#!/bin/bash

install_brew_package() {
  local package_name=$1

  if ! command -v "$package_name" &> /dev/null; then
    echo "$package_name not found, installing..."
    brew install "$package_name"
  else
    echo "$package_name is already installed"
  fi
}


install_kubectl() {
  if ! command -v kubectl &> /dev/null; then
    echo "kubectl not found, installing..."
    curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/darwin/arm64/kubectl"
    chmod +x ./kubectl
    sudo mv ./kubectl /usr/local/bin/kubectl
    sudo chown root: /usr/local/bin/kubectl
  else
    echo "kubectl is already installed"
  fi
}



packages=(
  "zsh"
  "git"
  "minikube"
  "helm"
  "awscli"
  "terraform"
  "graphviz"
  "jq"
  "base64"
)

for package in "${packages[@]}"; do
  install_brew_package "$package"
done

install_kubectl
