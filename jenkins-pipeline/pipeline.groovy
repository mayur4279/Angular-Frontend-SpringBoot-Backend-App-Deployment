pipeline {
    agent any

    stages {
        stage('Pull') {
            steps {
                git branch: 'main', url: 'https://github.com/mayur4279/Angular-Frontend-SpringBoot-Backend-App-Deployment'
            }
        }

        stage('Build') {
            steps { 
                sh 'echo  "build complete" ' 
            }
        }

        stage('Test') {
            steps { 
                sh 'echo  "Test complete" ' 
            }
        }

        stage('Deploy') {
            steps { 
                sh 'echo  "Deploy complete" ' 
            }
        }

    }
}
