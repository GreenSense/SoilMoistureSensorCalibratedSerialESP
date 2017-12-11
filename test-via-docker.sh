docker run -i --device /dev/ttyUSB0 --device /dev/ttyUSB1 -v /var/run/docker.sock:/var/run/docker.sock -v $PWD:/project jenkins-arm-iot-mono /bin/bash -c "cd /project && sh init.sh && sh build.sh && sh test-all.sh"