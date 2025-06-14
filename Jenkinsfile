pipeline {
    agent any
    stages {
        stage('Clone') {
            steps {
                git branch: 'dev', url: 'https://github.com/Akash041/devops-build.git'
            }
        }
        stage('Build') {
            steps {
                sh './build.sh'
            }
        }
        stage('Push Dev Image') {
            when {
                branch 'dev'
            }
            steps {
                sh 'docker push akashadmin07/react-app-dev'
            }
        }
        stage('Push Prod Image') {
            when {
                branch 'main'
            }
            steps {
                sh '''
                docker tag react-app akashadmin07/react-app-prod 
                docker push akashadmin07/react-app-prod
                '''
            }
        }
        stage('Deploy') {
            steps {
                sh './deploy.sh'
            }
        }
    }
}

