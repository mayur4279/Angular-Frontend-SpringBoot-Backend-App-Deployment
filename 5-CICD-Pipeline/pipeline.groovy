pipeline {
    agent any
    

    tools {
        maven 'install-maven' 
        dockerTool 'docker'
    }
    stages {
        stage('Pull') {
            steps {
                git branch: 'main', url: 'https://github.com/mayur4279/Angular-Frontend-SpringBoot-Backend-App-Deployment'
            }
        }

        stage('Build') {
            steps { 
                sh 'echo  "Spring Boot artifact building is started" '
                sh '''cd 2-SpringBoot-Backend
                    mvn clean package -Dmaven.test.skip=true '''
                sh 'ls'
            }
        }

        stage('Test') {
            steps { 
                sh 'echo  "Test completed" ' 
            }
        }

        stage('Deploy') {
            steps { 
                sh 'docker --version'
 
            }
        }
    }
}



