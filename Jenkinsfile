pipeline {

    options {
        disableConcurrentBuilds()
    }

    agent { label 'jenkins-bc-did' }

    environment {
        IMAGE = "docker.pkg.github.com/wgillaspy/arm64v8-avrdude/arm64v8-avrdude"
        TAG = "uno"
    }

    stages {

        stage('Build and push the image.') {
            steps {
                script {

                    withCredentials([usernamePassword(credentialsId: 'GITHUBUSER_TOKENPASS', usernameVariable: 'USER', passwordVariable: 'PASS')]) {

                        sh """
                           unset DOCKER_HOST
                           unset DOCKER_TLS_VERIFY
                           
                           docker login docker.pkg.github.com -u ${USER} -p ${PASS}
                           
                           wget https://downloads.arduino.cc/arduino-1.8.10-linuxaarch64.tar.xz
    
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