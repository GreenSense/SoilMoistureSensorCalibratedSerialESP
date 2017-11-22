#!/bin/sh

echo "----------------------------------------"
echo "Starting basic calibration test"

echo "Sending 255"

./lib/arduino-serial/arduino-serial --baud=9600 --port=/dev/ttyUSB1 --sendline="255"

#sleep 2

OUT=$(./lib/arduino-serial/arduino-serial --baud=9600 --port=/dev/ttyUSB0 -q -r)

echo $OUT

for pair in $(echo $OUT | sed "s/;/ /g")
do

  var1=$(echo $pair | cut -f1 -d:)
  var2=$(echo $pair | cut -f2 -d:)

  if [[ $var1 = "C" ]]
  then
      echo "Calibrated: $var2"

      if [ "$var2" -gt 1 ];then
        echo "Invalid result";
        exit 1;
      fi
  fi

  if [[ $var1 = "R" ]]
  then
      echo "Raw: $var2"


      if [ "$var2" -lt 1023 ];then
        echo "Invalid result";
        exit 1;
      fi

  fi

done

echo "Test section completed!"
echo ""

echo "Sending 0"

./lib/arduino-serial/arduino-serial --baud=9600 --port=/dev/ttyUSB1 --sendline="0"

#sleep 1

OUT=$(./lib/arduino-serial/arduino-serial --baud=9600 --port=/dev/ttyUSB0 -q -r)

echo $OUT


for pair in $(echo $OUT | sed "s/;/ /g")
do

  var1=$(echo $pair | cut -f1 -d:)
  var2=$(echo $pair | cut -f2 -d:)

  if [[ $var1 = "C" ]]
  then
      echo "Calibrated: $var2"

      if [ "$var2" -lt 99 ];then
        echo "Invalid result";
        exit 1;
      fi
  fi

  if [[ $var1 = "R" ]]
  then
      echo "Raw: $var2"

      if [ "$var2" -gt 4 ];then
        echo "Invalid result";
        exit 1;
      fi
  fi

done

echo "Test section completed!"
echo ""

echo "Test completed successfully!"
echo "----------------------------------------"
