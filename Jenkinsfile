pipeline{
    agent any
 stages {
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
      script {
      // Switch to the master branch
      git 'https://github.com/Deepika94/Capstone_project'

      //Stage the resolved Jenkinsfile
      //sh 'git add Jenkinsfile'

      //Commit the changes
      //sh 'git commit -m "Resolved merge conflict in Jenkinsfile"'

      // Push changes to remote master branch
      sh 'git merge master'

    }
   }
  }
  
  stage('Pull Image') {
    steps {
      withCredentials([usernamePassword(credentialsId: 'docker-id', passwordVariable: 'DOCKERHUB_PASSWORD', usernameVariable: 'DOCKERHUB_USERNAME')]) {
               sh "docker login -u $DOCKERHUB_USERNAME -p $DOCKERHUB_PASSWORD"
               //pull  the docker image to docker hub 
               sh "docker push deepikajag/dev:lts"
      }
    }
  }
 }
}