% Ultrasonic Proximity + Servo for analog readout
% This script is an idea for how to implement an analog readout from the
% ultrasonic detector using the servo motor

clear

% For the ultrasonic, I noticed an output of 0.3 from the sensor at the max
% end of the range ~11inches and a low of 0.02 from the closest range ~0
% inches
% For servo, input values range from 0 to 1
% SO use rescale

ultra_range = round(0.02:.01:0.3,2);
servo_range = rescale(ultra_range);

global echoPin
global trigPin

echoPin = 'D12';
trigPin = 'D11';

%distanceArduino = arduino('COM3','Uno','Libraries','Servo',...
%    'Libraries','JRodrigoTech/HCSR04');

distanceArduino = arduino();

s_motor = servo(distanceArduino,'D9'); % for servo motor
d_sensor = addon(distanceArduino,'JRodrigoTech/HCSR04',trigPin,echoPin); % for distance sensor


while(1)
    distance = readDistance(d_sensor);
    if distance > 0.3
        writePosition(s_motor,1);
    elseif distance <= 0.02
        writePosition(s_motor,0);
    else
        index = find(ultra_range == distance);
        writePosition(s_motor,servo_range(index));
    end
    pause(0.01);
end