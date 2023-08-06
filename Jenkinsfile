pipeline{
    agent any
 stages{
    stage('Build Docker Image') {
        steps {
          script {
             sh '/var/lib/jenkins/workspace/Automate-build/build.sh'
          }
        }
    }


    stage('Push Docker Image') {
         steps {
            withCredentials([usernamePassword(credentialsId: 'docker-id', passwordVariable: 'DOCKERHUB_PASSWORD', usernameVariable: 'DOCKERHUB_USERNAME')]) {
               sh "docker login -u $DOCKERHUB_USERNAME -p $DOCKERHUB_PASSWORD"
               //push the docker image to docker hub 
               sh "docker tag reactjs:lts deepikajag/dev:lts"
               sh "docker push deepikajag/dev:lts"
          }
        }
      }
      stage('Dev Merge to Master') {
        steps {
        //clone the git repository 
        git 'https://github.com/Deepika94/Capstone_project'

        //Checkout from the master
        sh 'git checkout dev'

        //Merge dev and master
        sh 'git merge master'
      }
      }
  }
 //Another Stage to define another tasks
   stages{
      stage ('Pull Image') {
        steps {
            withCredentials([usernamePassword(credentialsId: 'docker-id', passwordVariable: 'DOCKERHUB_PASSWORD', usernameVariable: 'DOCKERHUB_USERNAME')]) {
               sh "docker login -u $DOCKERHUB_USERNAME -p $DOCKERHUB_PASSWORD"
               //pull  the docker image to docker hub 
               sh "docker push deepikajag/dev:lts"
        }

      }
      stage ('Tag and Push Image') {
         steps{
            withCredentials([usernamePassword(credentialsId: 'docker-id', passwordVariable: 'DOCKERHUB_PASSWORD', usernameVariable: 'DOCKERHUB_USERNAME')]) {
               sh "docker login -u $DOCKERHUB_USERNAME -p $DOCKERHUB_PASSWORD"
               //push the docker image to docker hub 
               sh "docker tag deepikajag/dev:lts deepikajag/prod:lts"
               sh "docker push deepikajag/prod:lts"
        }

      }

   }
}