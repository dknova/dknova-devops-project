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
