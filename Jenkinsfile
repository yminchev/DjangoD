pipeline {
    environment {
    registry = "yminc.com:5000"
    registryCredential = 'DockerRegistry'
    dockerImage = 'mydjango'
    dockerfile = 'Django'
    dockerimage
    }
    
    stages('Build') {
        steps {
            dockerimage = docker.build(registry + ':$BUILD_NUMBER', "-f ${dockerfile} ./dockerfiles")
                  
        }
    }
}
