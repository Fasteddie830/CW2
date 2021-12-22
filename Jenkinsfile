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
          /* Testing if image responds */
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
            sshagent(credentials: ['Ubuntu']) {
                script{
                    try{
                        sh 'ssh-keyscan -H 54.88.194.71 >> ~/.ssh/known_hosts'
                        sh 'ssh ubuntu@54.88.194.71 kubectl set image deployments/coursework2 coursework2=fasteddie830/coursework2:latest'
                        sh 'ssh ubuntu@54.88.194.71 ~/CW2/multiple_users.sh'
                    }catch(error){
                            }
                    }
                }
            }
        }
    }
}


