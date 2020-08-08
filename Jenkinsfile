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

                    unset DOCKER_HOST
                    unset DOCKER_TLS_VERIFY

                    withCredentials([usernamePassword(credentialsId: 'GITHUBUSER_TOKENPASS', usernameVariable: 'USER', passwordVariable: 'PASS')]) {
                        sh "docker login docker.pkg.github.com -u ${USER} -p ${PASS}"
                    }

                    sh "wget https://downloads.arduino.cc/arduino-1.8.10-linuxaarch64.tar.xz"

                    sh "unxz arduino-1.8.10-linuxaarch64.tar.xz"
                    sh "tar xvf arduino-1.8.10-linuxaarch64.tar"

                    sh "docker build . -t ${IMAGE}:${TAG}"
                    sh "docker push ${IMAGE}:${TAG}"
                }
            }
        }
    }
}