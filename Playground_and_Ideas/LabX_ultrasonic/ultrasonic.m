% Ultrasonic Distance
% SUPER easy to use but NEED special library
% https://www.mathworks.com/matlabcentral/fileexchange/57898-hc-sr04-add-on-library-for-arduino

clear

global echoPin
global trigPin

ultraArduino = arduino('COM3','Uno','Libraries','JRodrigoTech/HCSR04');

echoPin = 'D12';
trigPin = 'D11';

sensor = addon(ultraArduino,'JRodrigoTech/HCSR04',trigPin,echoPin);

while(1)
    dist = readDistance(sensor)
    pause(0.1);
end