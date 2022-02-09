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
                    cat <<EOF> index.html
                    <html/>
                    <body bgcolor = "gray">
                    <center>
                    <h2>Hello world<h2/>
                    <center/>
                    <body/>
                    <html/>
                    EOF
                   '''
                sh 'echo "..........Build Finished.........."'
            }
        }
        
        stage('Test') {
            steps {
                
                sh 'echo "..........Test Started.........."'
               
                sh '''
                    if [ `grep "Hello" index.html | wc -l` >= "1"]
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
