pipeline {
    agent any

    environment {
        DOCKER_REGISTRY = "namanrajani" // Replace with your Docker registry URL
        DOCKER_IMAGE = "studySphere"         // Replace with your image name
        DOCKER_TAG = "${GIT_COMMIT}"              // Tag the image with the Git commit hash
        DOCKER_CREDENTIALS = 'dckr_pat_SW-McoaA53Y7O6HIZqiAO-VavpE' // Jenkins credentials ID for Docker registry
    }

    stages {
        stage('Checkout Code') {
            steps {
                // Checkout the code from your repository (e.g., Git)
                git 'https://github.com/Naman16rajani/STUDYSPHERE-ONLINE-LEARNING-COMMUNITY'  // Replace with your repo URL
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image
                    sh 'docker build -t $DOCKER_REGISTRY/$DOCKER_IMAGE:$DOCKER_TAG .'
                }
            }
        }

        stage('Login to Docker Registry') {
            steps {
                script {
                    // Login to Docker registry
                    withCredentials([usernamePassword(credentialsId: "$DOCKER_CREDENTIALS", usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                        sh "echo $DOCKER_PASSWORD | docker login $DOCKER_REGISTRY -u $DOCKER_USERNAME --password-stdin"
                    }
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    // Push the Docker image to the registry
                    sh 'docker push $DOCKER_REGISTRY/$DOCKER_IMAGE:$DOCKER_TAG'
                }
            }
        }

        stage('Clean Up') {
            steps {
                script {
                    // Remove local Docker image to save space
                    sh 'docker rmi $DOCKER_REGISTRY/$DOCKER_IMAGE:$DOCKER_TAG'
                }
            }
        }
    }

    post {
        always {
            // Cleanup after pipeline runs
            cleanWs()
        }
    }
}
