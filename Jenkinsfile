pipeline {
    environment {
    registry = "yminc.com:5000"
    registryCredential = 'DockerRegistry'
    dockerimage = 'mydjango'
    dockerfile = 'Django'
    mydocker = ''
    }
    
    agent any
    
    stages {
        stage('Build') {
        steps {
            script {
                mydocker = docker.build('${registry}/${dockerimage}:$BUILD_NUMBER', '-f ./Dockerfiles/${dockerfile} ./Dockerfiles')
            }
        }
        }
    }
}
