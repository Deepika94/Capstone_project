pipeline{
    agent any
 stages{
    stage('Build Docker Image') {
        steps {
          script {
             sh '/var/lib/jenkins/workspace/Automate-build/build.sh'
    stage('Push Docker Image') {
         steps {
            withCredentials([usernamePassword(credentialsId: 'docker-id', passwordVariable: 'DOCKERHUB_PASSWORD', usernameVariable: 'DOCKERHUB_USERNAME')]) {
               sh "docker login -u $DOCKERHUB_USERNAME -p $DOCKERHUB_PASSWORD"
               //push the docker image to docker hub 
               sh "docker push deepikajag/reactjs:lts"
        }
         }
      }
        }
     }
    }
 }
}