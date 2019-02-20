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
                mydocker = docker.build('${myregistry}/${dockerimage}:$BUILD_NUMBER', '-f ./Dockerfiles/Django ./Dockerfiles')
            }
        }
        }
        stage('Push') {
                steps {
                    script {
                        docker.withRegistry(myregistry,mycredentials)
                        mydocker.push()
                    }
                }
         }
        
    }
}
