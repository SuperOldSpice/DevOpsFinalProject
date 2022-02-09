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
                    echo "..........Build Finished.........."
                '''
            }
        }
    }
}
