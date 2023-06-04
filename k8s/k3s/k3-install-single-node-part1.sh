#!/bin/bash

# Recommended to run from sudo

# Install HELM
# https://helm.sh/docs/intro/install/
cd /tmp
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh

# Install K3 & Cilium
# https://docs.cilium.io/en/stable/installation/k8s-install-helm/

# Add Cilium repo
helm repo add cilium https://helm.cilium.io/

# Install K3s without a CNI
curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC='--flannel-backend=none --disable-network-policy' sh -

# Correct kubeconfig path
export KUBECONFIG=/etc/rancher/k3s/k3s.yaml

# Install Cilium
helm install cilium cilium/cilium --version 1.13.3 --set operator.replicas=1

# Reboot system
reboot
