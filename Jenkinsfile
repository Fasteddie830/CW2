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
                sh 'docker build -t ("fasteddie830/coursework2")'
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
            sshagent(['k8s-jenkins'])
            {
            sh 'scp -r -o StrictHostKeyChecking=no node-deployment.yaml ubuntu@172.17.0.2:/path'
            script{
                try{
                    sh 'ssh ubuntu@172.17.0.2 echo "hello"'
                }catch(error){
                        }
                }
                }
            }
        }
    }
}

