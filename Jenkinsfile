pipeline{
    agent any
 stages{
    stage('Build Docker Image') {
        steps {
        script {
            sh 'build.sh'
        }
     }
    }
 }
}