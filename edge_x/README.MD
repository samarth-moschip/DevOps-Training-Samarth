
---

# EdgeX Foundry with Python App Service (No Security, MQTT, ARM64)

This guide walks through setting up the EdgeX Foundry environment using `edgex-compose` on the `odessa` branch, running on ARM64, and integrating a custom **Python App Service** using the `app-functions-sdk-python`.

https://github.com/edgexfoundry/edgex-compose/tree/odessa
---

## 🧱 Prerequisites

* Docker and Docker Compose installed
* Python 3.10 and `python3.10-venv` available
* Git installed
* ARM64 architecture machine (e.g., Raspberry Pi)

---

## 📁 Terminal 1: Set Up EdgeX with Custom Services

### 1. Clone EdgeX Compose Repository

```bash
mkdir project
cd project
git clone git@github.com:edgexfoundry/edgex-compose.git
cd edgex-compose/
git checkout odessa
```

### 2. Build and Run Compose Builder

```bash
cd compose-builder/
sudo make run ds-opc-ua ds-mqtt mqtt-broker no-secty arm64
```

### 3. Check Docker Status

```bash
docker images
docker ps
docker logs edgex-core-data
docker logs edgex-device-opc-ua
```

### 4. To Stop Containers

```bash
sudo docker compose down
```

---

## 🐍 Terminal 2: Set Up Python App Service

### 1. Clone App Functions SDK

```bash
cd project/edgex-compose/compose-builder/
git clone https://github.com/edgexfoundry/app-functions-sdk-python.git
cd app-functions-sdk-python/
```

### 2. Navigate to Template App

```bash
cd app-service-template/
cd ..
```

### 3. Install Python Dependencies

```bash
sudo apt-get update
sudo apt install python3.10-venv --fix-missing
sudo apt install python3-pip-whl
python3.10 -m venv venv
source ./venv/bin/activate
pip install -e .
```

---
http://172.17.0.248:4000/en-US/#/core-data/event

## 🧩 Add Python App Service to Docker Compose

### 1. Edit `docker-compose.yml`

```bash
cd ..
sudo vim docker-compose.yml
```

### 2. Paste the Following (above `support-notifications` section)

```yaml
  app-service-python:
    image: app-service-python:latest
    container_name: app-service-python
    restart: unless-stopped
    ports:
      - "59780:59780"
    environment:
      EDGEX_SECURITY_SECRET_STORE: "false"
      EDGEX_USE_REGISTRY: "false"
      Service_Host: app-service-python
      Service_Port: 59780
      MessageBus_Type: mqtt
      MessageBus_Protocol: tcp
      MessageBus_Host: edgex-mqtt-broker
      MessageBus_Port: "1883"
      MessageBus_AuthMode: none
      MessageBus_Optional_ClientId: "app-service-python"
      Trigger_Type: edgex-messagebus
    volumes:
      - ./res:/res
    command: ["python3", "main.py", "-cc=./res/common-configuration.yaml"]
    networks:
      - edgex-network
    depends_on:
      core-data:
        condition: service_started
      mqtt-broker:
        condition: service_started
      core-common-config-bootstrapper:
        condition: service_started
```

---

## ▶️ Run Python App Service with EdgeX

```bash
sudo docker compose up -d
```

### Check Logs

```bash
sudo docker logs app-service-python
docker ps
```

---

## ✅ Expected Behavior

Once the app service is running:

* It subscribes to MQTT events from `edgex-mqtt-broker`.
* Processes messages using custom logic in `main.py`.
* Communicates with other EdgeX services like `core-data`.

---

## 📌 Notes

* Ensure that `res/common-configuration.yaml` exists and is configured correctly for the app service.
* Your Python logic can be added inside `main.py` or use the app-function pipeline from `app-functions-sdk-python`.

---

## 📂 Directory Structure (Recommended)

```bash
project/
├── edgex-compose/
│   ├── compose-builder/
│   │   ├── app-functions-sdk-python/
│   │   │   ├── app-service-template/
│   │   │   ├── venv/
│   │   │   └── ...
│   │   ├── docker-compose.yml
│   │   └── ...
```

---

## 🔗 References

* [EdgeX Foundry GitHub](https://github.com/edgexfoundry)
* [App Functions SDK Python](https://github.com/edgexfoundry/app-functions-sdk-python)

---



