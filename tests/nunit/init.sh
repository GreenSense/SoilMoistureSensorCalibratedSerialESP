DIR=$PWD

cd lib
sh get-libs.sh &&
cd $DIR

cd lib/ArduinoSerialControllerClient
sh init.sh
cd $DIR
