pipeline {
    environment {
    registry = "yminc.com:5000"
    registryCredential = 'DockerRegistry'
    dockerImage = 'mydjango'
    dockerfile = 'Django'
    dockerimage = ''
    }
    
    agent any
    
    stages {
        stage('Build') {
        steps {
            script {
            dockerimage = docker.build(registry + ':$BUILD_NUMBER', "-f ${dockerfile} ./Dockerfiles")
            }
        }
        }
    }
}
