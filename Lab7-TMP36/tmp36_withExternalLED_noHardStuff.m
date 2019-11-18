%% lab7-TMP36.m
% important note, since A2D... 
%   Voltage at pin in milliVolts = (reading from ADC) * (5000/1024)
% then to convert to degrees C
%   Centigrade temperature = [(analog voltage in mV) - 500] / 10

%% Make sure to remove the arduino object from workspace
clear
clc
close all

% Setup Arduino
spicyArduino = arduino('/dev/ttyUSB0','Uno');
tmp36Pin = 'A0';
ledPin = 'D13';

%%
clc

disp('Starting Reading...');
% How to get threshold? read a few voltages from pin from command window
threshold = 0.7; % threshold to turn on LED
dataPoints = 20; % number of data points to capture

% Enter in how long you want to take reading for in seconds
readTime = 10;

% Enter in how long you want the delay to be between readings
delayTime = 0.5;

% This gets the voltage from 
voltage = readVoltage(spicyArduino,tmp36Pin);

for j = 2:dataPoints
    voltage(j)=readVoltage(spicyArduino,tmp36Pin);
    disp(voltage(j));
    pause(delayTime);
    
    % Check if the temperature being read is greater than threshold
    if voltage(j) >= threshold
        % if it is, turn on the light
        writeDigitalPin(spicyArduino,ledPin,1);
    else
        % or else, turn it off
        writeDigitalPin(spicyArduino,ledPin,0);
    end
    
end

disp('Done!');

%% Have students figure out these things

% Convert the voltage array into a temperature array
temperature = (voltage - 0.5) * 100;

% Figure out how to create a "time" array cooresponding to their delay
time = 0:delayTime:dataPoints*delayTime-delayTime; % this is hard but fun puzzle

% Plot the temperature data
plot(time, temperature, 'r*');
xlabel('Time from Start [s]');
ylabel('Temperature [C]');

% Convert from C to F
tempF = temperature * 1.8 + 32;