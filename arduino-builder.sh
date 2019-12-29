mkdir /tmp/arduino_build
mkdir /tmp/arduino_cache

./arduino-builder \
  -compile \
  -logger=machine \
  -hardware /arduino-1.8.10/hardware   \
  -tools /arduino-1.8.10/tools-builder \
  -tools /arduino-1.8.10/hardware/tools/avr   \
  -built-in-libraries /arduino-1.8.10/libraries   \
  -fqbn=arduino:avr:pro:cpu=16MHzatmega328   \
  -ide-version=10810  \
  -build-path /tmp/arduino_build   \
  -warnings=all   \
  -build-cache /tmp/arduino_cache   \
  -prefs=build.warn_data_percentage=75  \
  -prefs=runtime.tools.avrdude.path=/arduino-1.8.10/hardware/tools/avr   \
  -prefs=runtime.tools.avrdude-6.3.0-arduino17.path=/arduino-1.8.10/hardware/tools/avr   \
  -prefs=runtime.tools.avr-gcc.path=/arduino-1.8.10/hardware/tools/avr  \
  -prefs=runtime.tools.avr-gcc-7.3.0-atmel3.6.1-arduino5.path=/arduino-1.8.10/hardware/tools/avr   \
  -prefs=runtime.tools.arduinoOTA.path=/arduino-1.8.10/hardware/tools/avr   \
  -prefs=runtime.tools.arduinoOTA-1.3.0.path=/arduino-1.8.10/hardware/tools/avr   \
  -verbose $1