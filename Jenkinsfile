def changedFiles = []

pipeline {

    options {
        disableConcurrentBuilds()
    }

    agent { label 'jenkins-bc-did' }

    environment {
        DEPLOY_INO = "no"
    }

    stages {
       stage("See what files have changed") {

           for (changeLogSet in currentBuild.changeSets) {
               for (entry in changeLogSet.getItems()) { // for each commit in the detected changes
                   for (file in entry.getAffectedFiles()) {
                       changedFiles.add(file.getPath()) // add changed file to list
                   }
               }
           }

           for (fileName in changedFiles) {
               println(fileName)
           }
       }

       stage('Build and push the image.') {
           steps {
              script {

//                  withCredentials([usernamePassword(credentialsId: 'GITHUBUSER_TOKENPASS', usernameVariable: 'USER', passwordVariable: 'PASS')]) {
//                      sh "docker login docker.pkg.github.com -u ${USER} -p ${PASS}"
//                  }
//
//                  sh "wget https://downloads.arduino.cc/arduino-1.8.10-linuxaarch64.tar.xz"
//
//                  sh "unxz arduino-1.8.10-linuxaarch64.tar.xz"
//                  sh "tar xvf arduino-1.8.10-linuxaarch64.tar"
//
//                  sh "docker build . -t docker.pkg.github.com/wgillaspy/arm64v8-avrdude/arm64v8-avrdude:latest"
//                  sh "docker push docker.pkg.github.com/wgillaspy/arm64v8-avrdude/arm64v8-avrdude:latest"
              }
           }

        }
    }
}