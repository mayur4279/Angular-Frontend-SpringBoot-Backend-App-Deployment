pipeline {
    agent any

    stages {
        stage('Pull') {
            steps {
                git branch: 'main', url: 'https://github.com/mayur4279/Angular-Frontend-SpringBoot-Backend-App-Deployment'
            }
        }

        stage('Angular build') {
            steps {  
                script {
                     withDockerRegistry(credentialsId: 'docker-crd') {
                            sh '''docker build  -t "mayur4279/docker-angular:angular"  ./1-Angular-Frontend 
                                  docker push mayur4279/docker-angular:angular'''
                     }    
                }
            }
        }

        stage('springboot build') {
            steps {  
                script {
                     withDockerRegistry(credentialsId: 'docker-crd') {
                            sh '''  docker build  -t "mayur4279/docker-angular:springboot"  ./2-SpringBoot-Backend 
                                    docker push mayur4279/docker-angular:springboot'''
                     }    
                }
            }
        }
        
        stage('mysql build') {
            steps {  
                script {
                     withDockerRegistry(credentialsId: 'docker-crd') {
                            sh ''' docker build  -t "mayur4279/docker-angular:mysql"  ./3-Mysql-Backend 
                                   docker push mayur4279/docker-angular:mysql'''
                     }    
                }
            }
        }


        stage('Test') {
            steps { 
                sh 'echo  "Test completed" ' 
            }
        }


        stage('Deploy to container') {
            steps { 
                sh 'docker run  -d  --name angular -p 80:80 --rm mayur4279/docker-angular:angular   '
                sh 'docker run  -d  --name springboot -p 8081:8080 --rm mayur4279/docker-angular:springboot  '
                sh 'docker run  -d  --name mysql -p 3306:3306 --rm  mayur4279/docker-angular:mysql  '
            }
        }
    }
}




