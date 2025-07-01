# Set Docker driver
minikube config set driver docker

# Start Minikube
minikube start --driver=docker

# Verify cluster
minikube status
kubectl cluster-info


# Create nginx-deployment.yaml
cat <<EOF > nginx-deployment.yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deployment
spec:
  replicas: 3
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginx:latest
        ports:
        - containerPort: 80
EOF

# Apply deployment
kubectl apply -f nginx-deployment.yaml

# Verify deployment
kubectl get deployments

# Deliverable: Pod status
kubectl get pods -o wide


# Create nginx-service.yaml
cat <<EOF > nginx-service.yaml
apiVersion: v1
kind: Service
metadata:
  name: nginx-deployment
spec:
  selector:
    app: nginx
  ports:
  - protocol: TCP
    port: 80
    targetPort: 80
  type: LoadBalancer
EOF

# Apply service
kubectl apply -f nginx-service.yaml

# Verify service
kubectl get svc nginx-deployment



# Start tunnel in a new terminal
sudo minikube tunnel

# Check external IP
kubectl get svc nginx-deployment

# Get service URL
minikube service nginx-deployment --url
