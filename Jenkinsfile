pipeline {
    agent any
   
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
                
                environment{
                     COUNTER = "${sh(script:'grep "Hello" index.html | wc -l', returnStdout: true).trim()}"
                }
                
                sh 'echo "..........Test Started.........."'
               
                sh '''
                    echo  ${COUNTER}
                    if [ " ${COUNTER}" >= "1"]
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
