pipeline {
    environment {
    myregistry = "yminc.com:5000"
    mycredentials = 'DockerRegistry'
    dockerimage = 'mydjango'
    dockerfile = './Dockerfiles/Django'
    mydocker = ''
    }
    
    agent any
    
    stages {
        stage('Build') {
        steps {
            script {
                mydocker = docker.build('mydjango:$BUILD_NUMBER', '-f ./Dockerfiles/Django ./Dockerfiles')
            }
        }
        }
        stage('Push') {
                steps {
                    script {
                        docker.withRegistry('https://'+myregistry,mycredentials) {
                        mydocker.push()
                        mydocker.push('latest')
                        }
                    }
                }
         }
        stage('Deploy') {
              steps {
                withCredentials([usernamePassword(credentialsID: 'deploy_django', usernameVariable: 'USERNAME', passwordVariable: 'USERPASS')]){
                    script {
                        sh "sshpass -p '$USERPASS' -v ssh -o SctrictHostKeyChecking=no $USERNAME@192.168.56.101 \"/home/django/django-deploy.sh\""
                    }
                    
                }
                                 
                                 
              }
              
              }
    }
}
