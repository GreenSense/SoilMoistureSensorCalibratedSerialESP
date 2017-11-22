#ifndef SOILMOISTURESENSOR_H_
#define SOILMOISTURESENSOR_H_

extern int soilMoistureLevelCalibrated;
extern int soilMoistureLevelRaw;

extern long lastSoilMoistureSensorReadingTime;
extern long soilMoistureSensorReadingInterval;

extern int drySoilMoistureCalibrationValue;
extern int wetSoilMoistureCalibrationValue;

extern bool soilMoistureSensorIsOn;
extern long lastSensorOnTime;
extern int delayAfterTurningSensorOn;
extern bool soilMoistureSensorReadingHasBeenTaken;

void setupSoilMoistureSensor();

void setupCalibrationValues();

void turnSoilMoistureSensorOn();

void turnSoilMoistureSensorOff();

void takeSoilMoistureSensorReading();

double getAverageSoilMoistureSensorReading();

double calculateSoilMoistureLevel(int soilMoistureSensorReading);

void setEEPROMIsCalibratedFlag();

void setDrySoilMoistureCalibrationValueToCurrent();

void setDrySoilMoistureCalibrationValue(int drySoilMoistureCalibrationValue);

void setWetSoilMoistureCalibrationValueToCurrent();

void setWetSoilMoistureCalibrationValue(int wetSoilMoistureCalibrationValue);

void reverseSoilMoistureCalibrationValues();

int getDrySoilMoistureCalibrationValue();

int getWetSoilMoistureCalibrationValue();

void setEEPROMIsCalibratedFlag();

void removeEEPROMIsCalibratedFlag();

void restoreDefaultCalibrationSettings();
#endif
/* SOILMOISTURESENSOR_H_ */
