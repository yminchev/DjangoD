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
                mydocker = docker.build(i${registry}/${dockerimage} + ':$BUILD_NUMBER', "-f ${dockerfile} ./Dockerfiles")
            }
        }
        }
    }
}
