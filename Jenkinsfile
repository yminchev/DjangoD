pipeline {
    agent { 
        dockerfile { 
            dir 'Dockerfiles'
            filename 'Django'
            registryUrl 'yminc.com:5000'
            registryCredentialsId 'DockerRegistry'
        } 
    }
}
