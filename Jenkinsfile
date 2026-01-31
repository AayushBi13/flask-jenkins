pipeline {
    agent {
        docker {
            image 'python:3.11-slim'
        }
    }

    stages {
        stage('Install Dependencies') {
            steps {
                sh 'pip install -r requirements.txt'
            }
        }

        stage('Run Tests & Coverage') {
            steps {
                sh 'pytest --cov=app --cov-report=xml tests/'
            }
        }
    }

    post {
        always {
            cleanWs()
        }
    }
}
