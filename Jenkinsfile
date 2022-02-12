pipeline {
	agent any
	environment {
		DOCKERHUB_CREDENTIALS = credentials('dockerhub_acc')
	}

	options {
	  	buildDiscarder logRotator(artifactDaysToKeepStr: '', artifactNumToKeepStr: '5', daysToKeepStr: '', numToKeepStr: '5')
	}

	 triggers {
		pollSCM('* * * * *')
	}
	
	stages {
        
		stage('Build') {

		    steps {
			sh 'echo "..........Build Started.........."'
			sh """
				sed "s/BUILD_NUMBER/${env.BUILD_NUMBER}/" index.html > output
				mv output index.html
			   """
			sh 'echo "..........Build Finished.........."'
			sh 'whoami'
		    }
		}

		stage('Test') {
		    steps {

			sh 'echo "..........Test Started.........."'

			sh '''
				result=`grep "Hello" index.html | wc -l`
				echo "result = $result"
				if [ $result -ge 1 ]
				then
					echo "Test Passed"
				else
					echo "Test Failed"
					exit 1
				fi
			 '''
			sh 'echo "...........Test Finished..........."'
		    }
		}

		stage('Docker Build') {
			steps {
				sh 'sudo docker build -t $DOCKERHUB_CREDENTIALS_USR/myapp:$GIT_BRANCH-$BUILD_NUMBER .' 
			}
		}
		
		stage('Push to DockerHub') {
			steps {
				sh 'echo $DOCKERHUB_CREDENTIALS_PSW | sudo docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
				sh 'sudo docker push $DOCKERHUB_CREDENTIALS_USR/myapp:$GIT_BRANCH-$BUILD_NUMBER'
			}
    		}


		stage("Deploy"){
			steps {
				s3Upload consoleLogLevel: 'INFO', dontSetBuildResultOnFailure: false, 
				dontWaitForConcurrentBuildCompletion: false, entries: [[bucket: 'the-final-project-bucket', 
				excludedFile: '', flatten: false, gzipFiles: false, keepForever: false, managedArtifacts: false, 
				noUploadOnFailure: true, selectedRegion: 'eu-central-1', 
				showDirectlyInBrowser: false, sourceFile: '**/index.html', 
				storageClass: 'STANDARD', uploadFromSlave: false, useServerSideEncryption: false]], 
				pluginFailureResultConstraint: 'FAILURE', profileName: 'S3-Artifact', userMetadata: []
			}
		}
	}
	
	post {
		always {
			sh 'sudo docker logout'
			cleanWs()
		}
	}
}
