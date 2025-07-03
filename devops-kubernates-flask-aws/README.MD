
---

````markdown
# 🧭 Deploy Kubernetes on AWS EKS from Ubuntu VM (EC2)

This README provides a step-by-step guide to creating and managing an Amazon EKS (Elastic Kubernetes Service) cluster using an Ubuntu EC2 instance as the control node. It includes installation of tools, EKS cluster creation, deployment of a web app, and exposing it via NodePort.

---

## ✅ 1. Environment Setup (Ubuntu EC2 Control Machine)

Launch an Ubuntu 20.04 EC2 instance in AWS that you'll use to manage your EKS cluster.

### 🧩 Required Permissions for IAM Role

Attach an **IAM Role** to this EC2 instance with the following policies:

- `AdministratorAccess`
- `AmazonEC2FullAccess`
- `AmazonVPCFullAccess`
- `AWSCloudFormationFullAccess`
- `IAMFullAccess`

---

## 🔧 2. Install Required Tools on Ubuntu

### 📦 Update System
```bash
sudo apt update && sudo apt upgrade -y
````

### 🛠️ Install AWS CLI

```bash
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
aws --version
```

### ☸️ Install `kubectl`

```bash
curl -o kubectl https://amazon-eks.s3.ap-south-1.amazonaws.com/1.29.0/2024-03-26/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin
kubectl version --client
```

### 📘 Install `eksctl`

```bash
curl --location "https://github.com/eksctl-io/eksctl/releases/latest/download/eksctl_Linux_amd64.tar.gz" | tar xz -C /tmp
sudo mv /tmp/eksctl /usr/local/bin
eksctl version
```

---

## ☁️ 3. Create EKS Cluster with Worker Nodes

Use `eksctl` to create your cluster with 2 worker nodes:

```bash
eksctl create cluster \
  --name samarth-cluster \
  --region ap-south-1 \
  --node-type t2.medium \
  --zones ap-south-1a,ap-south-1b \
  --nodes 2
```

This will:

* Create a VPC
* Create a control plane
* Launch two EC2 worker nodes
* Configure `kubeconfig`

### ✅ Verify Cluster

```bash
kubectl get nodes
```

---

## 🚀 4. Deploy Your Web Application

### ✍️ Create a Deployment YAML File (`web-app.yaml`)

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: my-web-app
spec:
  replicas: 2
  selector:
    matchLabels:
      app: my-web-app
  template:
    metadata:
      labels:
        app: my-web-app
    spec:
      containers:
      - name: web-container
        image: <your-dockerhub-username>/<image-name>:<tag>
        ports:
        - containerPort: 80
```

Replace `<your-dockerhub-username>/<image-name>:<tag>` with your actual container image.

### 📦 Deploy It

```bash
kubectl apply -f web-app.yaml
```

### 🧪 Confirm Pods Are Running

```bash
kubectl get pods
```

---

## 🌐 5. Expose Web App Using NodePort

### ✍️ Create Service YAML (`web-service.yaml`)

```yaml
apiVersion: v1
kind: Service
metadata:
  name: my-web-service
spec:
  selector:
    app: my-web-app
  ports:
    - protocol: TCP
      port: 80
      targetPort: 80
      nodePort: 30500
  type: NodePort
```

### 🚀 Deploy the Service

```bash
kubectl apply -f web-service.yaml
```

### 🔍 Get Service Info

```bash
kubectl get svc
```

---

## 🌍 6. Access the Web Application

1. Get the public IP address of any of your **worker nodes**:

   ```bash
   kubectl get nodes -o wide
   ```

2. Use the following URL to access your app:

   ```
   http://<worker-node-public-ip>:30500
   ```

> ✅ Ensure port `30500` is open in the **security group** attached to the worker nodes.

---

## 🧹 7. Clean Up

To delete the entire EKS cluster:

```bash
eksctl delete cluster --name samarth-cluster --region ap-south-1
```

---

## 🗂️ Example Folder Structure

```
eks-deployment/
├── web-app.yaml
└── web-service.yaml
```

---

## 🔐 Security Group Notes

Ensure that:

* Your EC2 (Ubuntu control node) allows outbound access (default: yes)
* EKS worker nodes’ security group allows inbound access on NodePort (30500)

---

## 📚 References

* [Amazon EKS Docs](https://docs.aws.amazon.com/eks/latest/userguide/what-is-eks.html)
* [eksctl GitHub](https://github.com/eksctl-io/eksctl)
* [kubectl Reference](https://kubernetes.io/docs/reference/kubectl/)

```

---
```

