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

### 2. Deployement and service using yaml
```bash
kubectl apply nginx-deployment.yaml
```
```bash
kubectl apply nginx-service.yaml

```

```bash

kubectl get pods 
```

``````bash
kubectl get svc
```




