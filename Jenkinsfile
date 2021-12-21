pipeline {
    agent any
    stages{
        stage('Clone repository') {
            steps{
                checkout scm
            }
            
        }
        stage('Build image') {
            /* The building of Ro… The coursework 2 image */
            steps{
                script{
                
                app = docker.build("fasteddie830/coursework2")
                }
            }
        }
        stage('Test image') {
          /* * Testing */
          steps{
            script{
            app.inside {
                sh 'echo "Tests passed"'
                    }
                }
            }
        }
        stage('Push image') {
            steps{
                script{
                    docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
                    app.push("${env.BUILD_NUMBER}")
                    app.push("latest")
                
                    }
                }  
            }
        }
        stage('Deploy to K8s') {
            steps{
            script{
                try{
                    sh 'ssh ubuntu@100.26.35.33'
                    sh 'echo hello'
                }catch(error){
                        }
                }
            }
        }
    }
}
