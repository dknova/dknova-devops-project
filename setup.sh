#!/bin/bash
echo "      DKNOVA Developer Setup"
# Detect Operating System
OS=$(uname)
echo "Operating System: $OS"

# Check Python
if command -v python3 >/dev/null 2>&1
then
    echo "Python is already installed."
    python3 --version
else
    echo "Python is not installed."

    if [ "$OS" = "Linux" ]; then
        echo "Installing Python..."
        sudo apt update
        sudo apt install -y python3 python3-pip python3-venv

    elif [ "$OS" = "Darwin" ]; then
        echo "Installing Python..."

        if command -v brew >/dev/null 2>&1
        then
            brew install python
        else
            echo "Homebrew is not installed."
            echo "Please install Homebrew first."
            exit 1
        fi
    else
        echo "Unsupported Operating System."
        exit 1
    fi
fi

# Check Git
if command -v git >/dev/null 2>&1
then
    echo "Git is already installed."
    git --version
else
    echo "Git is not installed."

    if [ "$OS" = "Linux" ]; then
        sudo apt update
        sudo apt install -y git

    elif [ "$OS" = "Darwin" ]; then
        brew install git

    else
        echo "Unsupported Operating System."
        exit 1
    fi
fi

# Create Virtual Environment
if [ ! -d "venv" ]
then
    echo "Creating Virtual Environment..."
    python3 -m venv venv
else
    echo "Virtual Environment already exists."
fi

# Activate Virtual Environment
echo "Activating Virtual Environment..."
source venv/bin/activate

# Install Dependencies
echo "Installing Dependencies..."
pip install -r requirements.txt

# Find Available Port
PORT=8001

while ss -ltn | grep -q ":$PORT "
do
    echo "Port $PORT is already in use."
    PORT=$((PORT+1))
done

echo "Using Port: $PORT"
echo ""
echo "Application is starting..."
echo "Open your browser and visit:"
echo "http://localhost:$PORT/docs"
echo "Press CTRL+C to stop the application."
# Start Application
uvicorn src.app:app --host 0.0.0.0 --port $PORT
