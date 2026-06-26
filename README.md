# Developer Setup Guide

## Step 1: Clone the Repository

```bash
git clone https://github.com/dknova/dknova-devops-project.git
cd dknova-devops-project
```

---

## Step 2: Make the Setup Script Executable

```bash
chmod +x setup.sh
```

---

## Step 3: Run the Setup Script

```bash
./setup.sh
```

---

## Step 4: Automated Setup

The setup script automatically performs the following tasks:

* Detects the operating system.
* Checks and installs Python (if required).
* Checks and installs Git (if required).
* Creates a Python virtual environment.
* Installs project dependencies.
* Finds an available port.
* Starts the FastAPI application.

---

## Step 5: Access the Application

Open the URL displayed in the terminal.

Example:

```text
http://localhost:8001/docs
```

or

```text
http://localhost:8002/docs
```

The setup script automatically selects an available port if the default port is already in use.

