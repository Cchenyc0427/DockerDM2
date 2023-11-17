pipeline {
    agent any

    environment {
        GRADLE_HOME = tool 'Gradle-8.4' 
        JAVA_HOME = tool 'jdk17'
        DOCKER_HUB_USER = credentials('jianfei.pu1@etu.univ-lorraine.fr')
        DOCKER_HUB_PASSWORD = credentials('Bengdawang9527')
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build with Gradle') {
            steps {
                sh "./gradlew build"
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    def dockerImageName = "java-test-app"
                    def dockerfile = "Dockerfile"

                
                    sh "docker build -t ${dockerImageName} -f ${dockerfile} ."

                  
                    withCredentials([usernamePassword(credentialsId: 'DOCKER_HUB_USER', usernameVariable: 'DOCKER_HUB_USER', passwordVariable: 'DOCKER_HUB_PASSWORD')]) {
                        sh "docker login -u ${DOCKER_HUB_USER} -p ${DOCKER_HUB_PASSWORD}"
                        sh "docker push ${dockerImageName}"
                    }
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                sh "docker run -d -p 8888:8080 ${dockerImageName}"
            }
        }
    }
}
