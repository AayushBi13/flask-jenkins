pipeline {
    agent any

    environment {
        // Define common tool names matching your Jenkins Global Tool Configuration
        SCANNER_HOME = tool 'SonarScanner' 
    }

    stages {
        stage('Checkout') {
            steps {
                // Pull code from your repository
                checkout scm
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'pip install -r requirements.txt'
            }
        }

        stage('Run Tests & Coverage') {
            steps {
                // Runs tests and generates an XML coverage report for SonarQube
                sh 'pytest --cov=app --cov-report=xml tests/'
            }
        }

        stage('SonarQube Analysis') {
            steps {
                // 'SonarQube' must match the Server Name in Jenkins System Settings
                withSonarQubeEnv('SonarQube') {
                    sh "${SCANNER_HOME}/bin/sonar-scanner"
                }
            }
        }

        stage("Quality Gate") {
            steps {
                // Pause pipeline until SonarQube returns the analysis result
                timeout(time: 5, unit: 'MINUTES') {
                    waitForQualityGate abortPipeline: true
                }
            }
        }
    }

    post {
        always {
            // Clean up the workspace after completion
            cleanWs()
        }
    }
}