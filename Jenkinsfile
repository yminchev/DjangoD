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
                withCredentials([usernamePassword(credentialsId: 'deploy_django', passwordVariable: 'USERPASS', usernameVariable: 'USERNAME')]) {
                   //# script {
                   //#     sh "sshpass -p '$USERPASS' -v ssh -o StrictHostKeyChecking=no $USERNAME@192.168.56.101 \"/home/django/django-deploy.sh\""
                   //# }
                    // some block
                    
                    sshPublisher(publishers: [sshPublisherDesc(configName: 'DockerDeploy', transfers: [sshTransfer(cleanRemote: false, excludes: '', execCommand: '/home/django/django-deploy.sh', execTimeout: 120000, flatten: false, makeEmptyDirs: false, noDefaultExcludes: false, patternSeparator: '[, ]+', remoteDirectory: '/home/django', remoteDirectorySDF: false, removePrefix: '', sourceFiles: 'django-deploy.sh')], usePromotionTimestamp: false, useWorkspaceInPromotion: false, verbose: false)])
                }
                                                
                                 
              }
              
              }
    }
}
