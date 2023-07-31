pipeline{
    agent any
 stages{
    stage('Build Docker Image') {
        steps {
          script {
            sh '/var/lib/jenkins/workspace/Job-Build/build.sh'
        }
     }
    }
 }
}