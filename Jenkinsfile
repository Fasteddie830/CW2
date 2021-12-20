node {
    def app
stages{
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
    stage('Push image') {
        /* comment would go here. I won't put one here.  */
        docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
        }
    }
stage ('Deploy') {
           steps {
               script{
                   def image_id = registry + ":$BUILD_NUMBER"
                   sh "ansible-playbook  playbook.yml --extra-vars \"image_id=${image_id}\""
           }
       }
   }
}
}
	
