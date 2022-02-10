pipeline {
    agent any
    environment {
        NAME = "Dmytro Kubai"
    }
   
    stages {
        
        stage('Build') {
            
            steps {
                sh 'echo "..........Build Started.........."'
                sh '''
			sed 's/BUILD_NUMBER/${env.BUILD_NUMBER}/' index.html
                   '''
                sh 'echo "..........Build Finished.........."'
            }
        }
        
        stage('Test') {
            steps {
                
                sh 'echo "..........Test Started.........."'
               
                sh '''
                    result=`grep "Hello" index.html | wc -l`
                    echo $result
                    if [ $result >= $1 ]
                    then
                            echo "Test Passed"
                    else
                            echo "Test Failed"
                            exit 1
                    fi

                '''
                sh 'echo "..........Test Finished.........."'
            }
        }
    }
}
