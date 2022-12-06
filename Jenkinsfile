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
                sh 'docker build -t locthp/testing:1.0 .'
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
                sh 'docker push locthp/testing:1.0'
            }
        }
    }
}
