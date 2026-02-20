pipeline {
    agent any

    environment {
        VENV = "venv"
    }

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Create Virtual Environment') {
            steps {
                sh '''
                    python3 --version
                    python3 -m venv $VENV
                '''
            }
        }

        stage('Install Dependencies') {
            steps {
                sh '''
                    . $VENV/bin/activate
                    python -m pip install --upgrade pip
                    pip install -r requirements.txt
                '''
            }
        }

        stage('Run Tests & Coverage') {
            steps {
                sh '''
                    . $VENV/bin/activate
                    python -m pytest --cov=app --cov-report=xml tests/
                '''
            }
        }
    }

    post {
        always {
            cleanWs()
        }
    }
}