pipeline {
  environment {
    registry = "awsvishalmothey/jenkinspipeline"
    registryCredential = 'mydockerhub'
    dockerImage = ''
  }    
  agent any
  tools {maven "maven382" }
  stages {
    stage('Cloning Git') {
      steps {
        git 'https://github.com/vishalmothey/game-of-life.git'
      }
    }
        stage('Build'){
            steps{
                 sh script: 'mvn clean package'
         }
       }
    stage('Building image') {
      steps{
        script {
          dockerImage = docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }
    stage('Deploy Image') {
      steps{
         script {
            docker.withRegistry( '', registryCredential ) {
            dockerImage.push()
            }    
          }
        }
      }
    stage('Remove Unused docker image') {
      steps{
        sh "docker rmi $registry:$BUILD_NUMBER"
        sh "docker run -d --name Inspiredit9 -p 8088:8080 awsvishalmothey/jenkinspipeline:$BUILD_NUMBER"
        
      }
    }     
      }
   }
