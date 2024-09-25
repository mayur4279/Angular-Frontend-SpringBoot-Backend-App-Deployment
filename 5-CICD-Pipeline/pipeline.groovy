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
                sh 'echo  "Angular artifact building is started" '
                sh 'cd 1-Angular-Frontend'
                sh 'sudo mvn clean package -Dmaven.test.skip=true'

            }
        }

        stage('Test') {
            steps { 
                sh 'echo  "Test completed" ' 
            }
        }

        stage('Deploy') {
            steps { 
                sh 'yum install docker -y  '
                sh 'sudo systemctl start docker '
                sh 'sudo systemctl enable docker ' 
            }
        }
    }
}



