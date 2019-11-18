% Make sure to remove the arduino object from workspace
clear

% Setup Arduino
trimArduino = arduino();
trimPin = 'A5';
ledGreenPin = 'D9';
ledYellowPin = 'D10';
ledRedPin = 'D11';

time = 200;

% Blink built-in LED 10 times
while time > 0
    voltage = readVoltage(trimArduino,trimPin)
    writePWMVoltage(trimArduino,ledGreenPin,voltage);
    writePWMVoltage(trimArduino,ledYellowPin,voltage);
    writePWMVoltage(trimArduino,ledRedPin,voltage);
    pause(0.1);
    time = time - 1;
end
disp('Done!')