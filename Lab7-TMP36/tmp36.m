% lab7-TMP36.m
% important note, since A2D... 
%   Voltage at pin in milliVolts = (reading from ADC) * (5000/1024)
% then to convert to degrees C
%   Centigrade temperature = [(analog voltage in mV) - 500] / 10

% Make sure to remove the arduino object from workspace
clear
clc
close all

% Setup Arduino
spicyArduino = arduino('/dev/ttyUSB0','Uno');
tmp36Pin = 'A0';

% Enter in how long you want to take reading for in seconds
readTime = 10;

% Enter in how long you want the delay to be between readings
delayTime = 0.75;

% Calculate integer value for data points
dataPoints = ceil((readTime*(1/delayTime)));

initialTemp = pinReadToTemp(readVoltage(spicyArduino,tmp36Pin));

temperature = ones(1,dataPoints)*initialTemp;
timePoints = 1:length(temperature);
tempPlot = plot(timePoints,temperature,'r*--');
xlabel('Data Points');
ylabel('Temp C');

set(tempPlot,'XDataSource','timePoints');
set(tempPlot,'YDataSource','temperature');

for i = 1:dataPoints
    temperature(i)=pinReadToTemp(readVoltage(spicyArduino,tmp36Pin));
    disp(temperature(i));
    refreshdata
    pause(delayTime);
end

function temp = pinReadToTemp(reading)
temp = (reading - 0.5) * 100;
end