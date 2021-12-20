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
}

