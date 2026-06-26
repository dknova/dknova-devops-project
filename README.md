# DKNOVA DevOps Project

# Project Overview

This project is a FastAPI-based application with Docker, Kubernetes, Helm, and Prometheus monitoring support. It includes an automated developer setup script (`setup.sh`) to simplify onboarding.


# Prerequisites

* Git
* Linux or macOS
* Internet connection


# Clone the Repository

```bash
git clone https://github.com/dknova/dknova-devops-project.git
cd dknova-devops-project
```



# Run the Project

Give execute permission to the setup script:

```bash
chmod +x setup.sh
```

Run the setup script:

```bash
./setup.sh
```

The setup script will automatically:

* Detect the operating system.
* Check/install Python (if supported by the script).
* Check/install Git (if supported by the script).
* Create a Python virtual environment.
* Install project dependencies.
* Find an available port.
* Start the FastAPI application.



## Access the Application

After the application starts, open:

```text
http://localhost:<PORT>/docs
```

Example:

```text
http://localhost:8001/docs
```

or

```text
http://localhost:8002/docs
```

depending on the available port.

---

# Project Structure

```
src/                 Application source code
tests/               Unit tests
k8s/                 Kubernetes manifests
helm/                Helm chart
monitoring/          Monitoring configuration
Dockerfile           Docker image
requirements.txt     Python dependencies
setup.sh             Automated developer setup
README.md            Project documentation
```

