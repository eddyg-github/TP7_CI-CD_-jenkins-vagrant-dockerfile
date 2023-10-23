pipeline {
    agent any

    stages {
        stage('Stop and Remove Existing Container') {
            steps {
                script {
                    def containerName = "my-nginx-container"  // Reemplaza con el nombre de tu contenedor
                    def existingContainer = sh(script: "docker ps -q -f name=${containerName}", returnStatus: true, quiet: true).trim()
                    if (existingContainer == 0) {
                        echo "No existing container found."
                    } else {
                        echo "Stopping and removing existing container..."
                        sh "docker stop ${containerName}"
                        sh "docker rm ${containerName}"
                    }
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    def customImage = docker.build("eddyedged/nginx-app:${env.BUILD_NUMBER}")
                    customImage.inside {
                        sh 'nginx -g "daemon off;"'
                    }
                }
            }
        }
        stage('Test Application') {
            steps {
                sh 'curl http://localhost:80'  // Ejemplo de una prueba simple
            }
        }
        stage('Push Docker Image to DockerHub') {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'dockerhub-credentials') {
                        customImage.push()
                    }
                }
            }
        }
    }
}

// Disparador periódico para ejecutar el pipeline a las 2:00 a. m. todos los días
triggers {
    cron('0 2 * * *')
}
