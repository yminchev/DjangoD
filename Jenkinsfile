pipeline {
    environment {
    registry = "yminc.com:5000"
    registryCredential = 'DockerRegistry'
    dockerImage = 'mydjango'
    dockerfile = 'Django'
    }
    
    stages('Build') {
        steps {
            docker.build(registry + ':$BUILD_NUMBER')
                  
        }
    }
}
