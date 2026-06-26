pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                echo 'Checking out source code...'
                checkout scm
            }
        }

        stage('Workspace') {
            steps {
                echo 'Listing project files...'
                sh 'pwd'
                sh 'ls -la'
            }
        }

        stage('Python Version') {
            steps {
                echo 'Checking Python version...'
                sh 'python3 --version'
            }
        }

        stage('Install Dependencies') {
    steps {
        echo 'Creating Python virtual environment...'
        sh '''
            python3 -m venv venv
            . venv/bin/activate
            pip install --upgrade pip
            pip install -r requirements.txt
        '''
    }
}

        stage('Run Tests') {
    steps {
        echo 'Running Unit Tests...'
        sh '''
            . venv/bin/activate
            PYTHONPATH=. python -m pytest tests/
        '''
    }
}
       stage('Build Docker Image') {
    steps {
        echo 'Building Docker image...'
        sh 'docker build -t dknova-devops-app:latest .'
    }
}
      stage('Push Docker Image') {
    steps {
        withCredentials([usernamePassword(
            credentialsId: 'dockerhub',
            usernameVariable: 'DOCKER_USER',
            passwordVariable: 'DOCKER_PASS'
        )]) {
            sh '''
                echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin
                docker tag dknova-devops-app:latest dknova2/dknova-devops-app:latest
                docker push dknova2/dknova-devops-app:latest
            '''
        }
    }
}
        stage('Pipeline Complete') {
            steps {
                echo 'CI Pipeline executed successfully.'
            }
        }
    }

    post {
        success {
            echo 'Build completed successfully.'
        }

        failure {
            echo 'Build failed.'
        }

        always {
            echo 'Pipeline execution finished.'
        }
    }
}
