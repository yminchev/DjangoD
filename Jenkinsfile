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
                    sshPublisher(
                        publishers: [
                            sshPublisherDesc(
                                configName: 'DockerDeploy',
                                #sshCredentials: [
                                 #   username: "$USERNAME",
                                  #  encryptedPassphrase: "$USERPASS"
                                 #],
                        transfers: [
                            sshTransfer(
                                sourceFiles: 'django-deploy.sh',
                                remoteDiectory: '/home/django',
                                execCommand: '/home/django/django-deploy.sh'
                                
                            )
                        ]
                                )
                     ]
                    )
                }
                                 
                                 
              }
              
              }
    }
}
