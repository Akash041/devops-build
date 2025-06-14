pipeline {
    agent any

    environment {
        DOCKER_HUB_USER = "akashadmin07"
        IMAGE_NAME = "react-app"
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'chmod +x build.sh'
                sh './build.sh'
            }
        }

        stage('Tag and Push Image') {
            steps {
                script {
                    def tagName = (env.BRANCH_NAME == 'main') ? 'react-app-prod' : 'react-app-dev'
                    def fullImage = "${DOCKER_HUB_USER}/${tagName}:latest"

                    withCredentials([usernamePassword(credentialsId: 'dockerhub', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                        sh """
                        echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin
                        docker tag ${IMAGE_NAME} ${fullImage}
                        docker push ${fullImage}
                        docker logout
                        """
                    }
                }
            }
        }

        stage('Deploy Container') {
            steps {
                sh 'chmod +x deploy.sh'
                sh "export BRANCH_NAME=${env.BRANCH_NAME} && ./deploy.sh"
            }
        }
    }
}
