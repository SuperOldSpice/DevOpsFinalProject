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
                sh 'echo "..........Test Started.........."'
                sh '''
                    result = `grep "Hello" index.html | wc -l`
                    echo $result
                '''
                sh 'echo "..........Test Finished.........."'
            }
        }
    }
}
