# 🚀 NGINX Deployment on Minikube

This project demonstrates how to deploy an NGINX web server using a Kubernetes Deployment with 2 replicas, expose it using a NodePort service, and access it via browser or curl using Minikube.

## 📦 Requirements

- Ubuntu 22.04+
- Minikube (`qemu2` driver or alternative)
- Docker
- kubectl

## ⚙️ Setup Instructions

### 1. Start Minikube

```bash
minikube start --driver=qemu2

```
kubectl apply nginx-deployment.yaml
kubectl apply nginx-service.yaml



kubectl get pods 
kubectl get svc


