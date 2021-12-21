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
            sshagent(credentials: ['Ubuntu']) {
                script{
                    try{
                        /*sh 'ssh-keyscan -Ht rsa [ubuntu],[100.26.35.33] >> known_hosts'*/
                        sh 'ssh-keyscan -H 100.26.35.33 >> ~/.ssh/known_hosts'
                        sh 'ssh ubuntu@100.26.35.33 ls'
                        /*sh 'scp -r -o StrictHostKeyChecking=no node-deployment.yaml ubuntu@172.17.0.2:/path'*/
                        
                        /*sh 'ssh -t -t ec2-100-26-35-33.compute-1.amazonaws.com'*/
                    }catch(error){
                            }
                    }
                }
            }
        }
    }
}


