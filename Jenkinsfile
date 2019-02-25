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
                        mydocker.push('latest')
                        }
                    }
                }
         }
        
    }
}
