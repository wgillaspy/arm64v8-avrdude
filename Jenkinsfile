pipeline {

    options {
        disableConcurrentBuilds()
    }

    agent { label 'jenkins-bc-did' }

    environment {
        IMAGE = "docker.pkg.github.com/wgillaspy/arm64v8-avrdude/arm64v8-avrdude"
        TAG = "uno"
        ARDUINO_DOWNLOAD_FILENAME = "arduino-1.8.10-linuxaarch64.tar.xz"
        ARDUINO_DOWNLOAD = "https://downloads.arduino.cc/arduino-1.8.10-linuxaarch64.tar.xz"
    }

    stages {

        stage('Build and push the image.') {
            steps {
                script {

                    if (fileExists(ARDUINO_DOWNLOAD_FILENAME)) {
                        println "Arduino already downloaded."
                    } else {
                        sh "wget ${ARDUINO_DOWNLOAD}"
                    }

                    withCredentials([usernamePassword(credentialsId: 'GITHUBUSER_TOKENPASS', usernameVariable: 'USER', passwordVariable: 'PASS')]) {

                        sh """
                           unset DOCKER_HOST
                           unset DOCKER_TLS_VERIFY
                           
                           docker login docker.pkg.github.com -u ${USER} -p ${PASS}
    
                           unxz arduino-1.8.10-linuxaarch64.tar.xz
                           tar xvf arduino-1.8.10-linuxaarch64.tar
    
                           docker build . -t ${IMAGE}:${TAG}
                           docker push ${IMAGE}:${TAG}
                        """
                    }

                }
            }
        }
    }
}