FROM arm64v8/ubuntu

RUN apt-get update -y

COPY arduino-1.8.10 /arduino-1.8.10
COPY arduino-builder.sh /arduino-builder.sh
COPY libraries /arduino-1.8.10/libraries

RUN chmod +x arduino-builder.sh




