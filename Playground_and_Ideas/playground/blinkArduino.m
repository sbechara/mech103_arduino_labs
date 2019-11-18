% Make sure to remove the arduino object from workspace
clear

% Setup Arduino
LEDArduino = arduino('/dev/ttyUSB0','uno');
ledPin = 'D13';

% Blink built-in LED 10 times
for i = 1:10
    writeDigitalPin(LEDArduino,ledPin,0);
    pause(0.25);
    writeDigitalPin(LEDArduino,ledPin,1);
    pause(0.25);
end

disp('Done!')