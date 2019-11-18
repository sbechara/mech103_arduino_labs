% Make sure to remove the arduino object from workspace
clear


% Setup Arduino
global greenPin
global yellowPin
global redPin

trafficArduino = arduino();
greenPin = 'D9';
yellowPin = 'D8';
redPin = 'D7';

delay = 0.15;

% Blink built-in LED 10 times
while(1)
    greenOn(trafficArduino);
    pause(delay);
    yellowOn(trafficArduino);
    pause(delay);
    redOn(trafficArduino);
    pause(delay);
end

function greenOn(arduino)
global greenPin yellowPin redPin
    writeDigitalPin(arduino,greenPin,1);
    writeDigitalPin(arduino,redPin,0);
    writeDigitalPin(arduino,yellowPin,0);
end

function yellowOn(arduino)
global greenPin yellowPin redPin
    writeDigitalPin(arduino,greenPin,0);
    writeDigitalPin(arduino,redPin,0);
    writeDigitalPin(arduino,yellowPin,1);
end

function redOn(arduino)
global greenPin yellowPin redPin
    writeDigitalPin(arduino,greenPin,0);
    writeDigitalPin(arduino,redPin,1);
    writeDigitalPin(arduino,yellowPin,0);
end