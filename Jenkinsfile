pipeline {

    options {
        disableConcurrentBuilds()
    }

    agent { label 'jenkins-bc-did' }

    stages {

       stage('Build and push the image.') {
           steps {
              script {



                  sh "nslookup google.com"
                  sh "nslookup docker.pkg.github.com"

                  withCredentials([usernamePassword(credentialsId: 'GITHUBUSER_TOKENPASS', usernameVariable: 'USER', passwordVariable: 'PASS')]) {
                      sh "echo 'docker login docker.pkg.github.com -u ${USER} -p ${PASS}' > out"
                  }

                  sh "cat out"

                  sh "docker build . -t docker.pkg.github.com/wgillaspy/arm64v8-avrdude:latest"
                  sh "docker push docker.pkg.github.com/wgillaspy/arm64v8-avrdude:latest"
              }
           }

        }
    }
}