FROM arm64v8/ubuntu

RUN apt-get update -y
RUN apt-get install -y avrdude gcc-avr avr-libc arduino-core arduino-mk

