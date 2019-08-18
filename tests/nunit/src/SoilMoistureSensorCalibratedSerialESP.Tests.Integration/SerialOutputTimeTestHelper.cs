﻿using System;

namespace SoilMoistureSensorCalibratedSerialESP.Tests.Integration
{
    public class SerialOutputTimeTestHelper : GreenSenseMqttHardwareTestHelper
    {
        public int ReadInterval = 1;

        public void TestSerialOutputTime ()
        {
            WriteTitleText ("Starting serial output time test");

            Console.WriteLine ("Read interval: " + ReadInterval);

            RequireMqttConnection = false;

            ConnectDevices ();

            SetDeviceReadInterval (ReadInterval);

            ReadFromDeviceAndOutputToConsole ();

            // Skip some data before checking the output time
            WaitForData (2);

            // Get the time until the next data line
            var secondsBetweenDataLines = WaitUntilDataLine ();

            var expectedTimeBetweenDataLines = ReadInterval;

            Console.WriteLine ("Time between data lines: " + secondsBetweenDataLines + " seconds");

            AssertIsWithinRange ("serial output time", expectedTimeBetweenDataLines, secondsBetweenDataLines, TimeErrorMargin);
        }
    }
}
