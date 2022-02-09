pipeline {
    agent { docker { image 'python:3.10.1-alpine' } }
    stages {
	
	stage('build') {
            steps {
                sh 'python --version'
            }
    }
    post {
        always {
            echo 'This will always run'
        }
        success {
            echo 'This will run only if successful'
        }
        failure {
            echo 'This will run only if failed'
        }
        unstable {
            echo 'This will run only if the run was marked as unstable'
        }
        changed {
            echo 'This will run only if the state of the Pipeline has changed'
        }
    }
}