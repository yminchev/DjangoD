pipeline {
    environment {
    registry = "gustavoapolinario/docker-test"
    registryCredential = 'dockerhub'
    dockerImage = ''
  }
    agent { 
        dockerfile { 
            dir 'Dockerfiles'
            filename 'Django'
            registryUrl 'yminc.com:5000'
            registryCredentialsId 'DockerRegistry'
        }
    }
    stages('Test') {
        steps {
        }
    }
}
