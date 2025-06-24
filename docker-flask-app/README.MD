# Simple Flask Web App with Docker
 
A basic Flask web application containerized with Docker.
 
## Setup Instructions
 
### Prerequisites
- Docker installed on your system
 
### Building the Docker Image
1. Clone this repository:
   ```bash
git clone "git@github.com:samarth-moschip/DevOps-Training-Samarth.git"
   cd simple-flask-app
   ```
 
2. Build the Docker image:
   ```bash
   docker build -t simple-flask-app .
   ```
 
### Running the Container
```bash
docker run -p 5000:5000 simple-flask-app
```
 
### Accessing the Application
Open your web browser and navigate to:
```
http://localhost:5000
```
 
You should see the Flask application running.
```
 
## 4. Building and Running the Docker Image
 
1. Save all the files in a directory (following the structure above)
2. Open a terminal in that directory
3. Build the Docker image:
   ```bash
   docker build -t simple-flask-app .
   ```
4. Run the container:
   ```bash
   docker run -p 5000:5000 simple-flask-app
   ```
5. Access the app at http://localhost:5000
 
