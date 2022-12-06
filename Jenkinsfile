pipeline {
    agent any
    environment {
		DOCKERHUB_CREDENTIALS=credentials('dockerhub-locthp')
	}

    stages {
        stage('Build') {
            steps {
                sh 'whoami'
                sh 'pwd'
                sh 'ls -la'
                sh 'docker build -t locthp/testing:latest .'
            }
        }
        stage("Login-to-dockerhub")
        {
            steps{
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }
        stage("Push-to-dockerhub"){
            steps{
                sh 'docker push locthp/testing:latest'
            }
        }
        stage("Copy-deployment-to-k8s")
        {
            steps{
                sh 'scp deployment.yaml administrator@172.16.77.158:/home/administrator/'
                sh 'ssh administrator@172.16.77.158 "ls -la"'
            }
        }
        stage("Deploy-to-k8s"){
            steps{
                sh 'ssh administrator@172.16.77.158 "kubectl create -f deployment.yaml;kubectl apply -f deployment.yaml"'
            }
        }
    }
}
