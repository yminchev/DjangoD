pipeline {
    agent { 
        dockerfile { 
            dir 'Dockerfiles'
            file 'Django'
            registryUrl 'yminc.com:5000'
            registryCredentialsId 'DockerRegistry'
        } 
    }
}
