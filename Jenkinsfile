pipeline {

    options {
        disableConcurrentBuilds()
    }

    agent { label 'jenkins-bc-did' }

    stages {

       stage('Build and push the image.') {
           steps {
              script {

                  withCredentials([usernamePassword(credentialsId: 'GITHUBUSER_TOKENPASS', usernameVariable: 'USER', passwordVariable: 'PASS')]) {
                      sh "docker login docker.pkg.github.com -u ${USER} -p ${PASS}"
                  }

                  sh "wget https://downloads.arduino.cc/arduino-1.8.10-linuxaarch64.tar.xz"

                  sh "unxz arduino-1.8.10-linuxaarch64.tar.xz"
                  sh "tar xvf arduino-1.8.10-linuxaarch64.tar"

                  sh "docker build . -t docker.pkg.github.com/wgillaspy/arm64v8-avrdude/arm64v8-avrdude:latest"
                  sh "docker push docker.pkg.github.com/wgillaspy/arm64v8-avrdude/arm64v8-avrdude:latest"
              }
           }

        }
    }
}