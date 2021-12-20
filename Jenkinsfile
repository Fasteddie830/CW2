node {
    def app
    stage('Clone repository') {
        checkout scm
    }
    stage('Build image') {
        /* The building of Ro… The coursework 2 image */
        app = docker.build("fasteddie830/coursework2")
    }
    stage('Test image') {
      /* * Testing */
        app.inside {
            sh 'echo "Tests passed"'
        }
    }
    /*stage('Push image') {
        /* Finally, we'll push the image with two tags:
         * First, the incremental build number from Jenkins
         * Second, the 'latest' tag.
         * Pushing multiple tags is cheap, as all the layers are reused. */
        docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
        }
    }*/
}

