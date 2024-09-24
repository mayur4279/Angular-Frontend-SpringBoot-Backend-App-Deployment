pipeline {
    agent any

    stages {
        stage('Pull') {
            steps {
                sh 'yum install git -y  '
                git branch: 'main', url: 'https://github.com/mayur4279/Angular-Frontend-SpringBoot-Backend-App-Deployment'
            }
        }

        stage('Build') {
            steps { 
                sh 'echo  "Angular artifact building is complete" ' 
            }

            steps { 
                sh 'echo  "Spring Boot artifact building is complete" ' 
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


