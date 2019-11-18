% Note: must do new arduinosetup and make sure ultrasonic is selected
clear;close all;clc;

% Define Pins
TRIG_PIN = 'D8';
ECHO_PIN = 'D7';
SPEAK_PIN = 'D9';
GLED_1 = 'D6';
GLED_2 = 'D5';
YLED = 'D4';
RLED_1 = 'D3';
RLED_2 = 'D2';

% Setup arduino object
sensyArduino = arduino('/dev/ttyUSB0','Uno','libraries','ultrasonic');

% Setup ultrasonic sensor
ultraSensor = ultrasonic(sensyArduino,TRIG_PIN,ECHO_PIN);

% Trick with this lab will be getting nested loops correct. Good!
% Need to make sure the specifications are clear


while(1)
    distance = readDistance(ultraSensor);
    
    % distance is actually calculated in meters, it is crazy accurate
    % this statement here actually will map the distance to the PWM duty
    % cycle for distances less than 1 meter. Effectively a 1 meter
    % proximity alarm!
    if distance == Inf || distance > 1
        % turn speaker off
        writePWMDutyCycle(sensyArduino,SPEAK_PIN,0);
        
        if distance > 2
            writeDigitalPin(sensyArduino,GLED_1,1);
            writeDigitalPin(sensyArduino,GLED_2,1);
            writeDigitalPin(sensyArduino,RLED_1,0);
            writeDigitalPin(sensyArduino,RLED_2,0);
            writeDigitalPin(sensyArduino,YLED,0);
        elseif distance > 1
            writeDigitalPin(sensyArduino,GLED_1,0);
            writeDigitalPin(sensyArduino,GLED_2,1);
            writeDigitalPin(sensyArduino,RLED_1,0);
            writeDigitalPin(sensyArduino,RLED_2,0);
            writeDigitalPin(sensyArduino,YLED,0);
        end
        if distance < 1.25
            writeDigitalPin(sensyArduino,GLED_1,0);
            writeDigitalPin(sensyArduino,GLED_2,1);
            writeDigitalPin(sensyArduino,RLED_1,0);
            writeDigitalPin(sensyArduino,RLED_2,0);
            writeDigitalPin(sensyArduino,YLED,1);
        end
    else
        writePWMDutyCycle(sensyArduino,SPEAK_PIN,distance);
        if distance > 0.75
            writeDigitalPin(sensyArduino,GLED_1,0);
            writeDigitalPin(sensyArduino,GLED_2,0);
            writeDigitalPin(sensyArduino,RLED_1,1);
            writeDigitalPin(sensyArduino,RLED_2,0);
            writeDigitalPin(sensyArduino,YLED,1);
        elseif distance > 0
            writeDigitalPin(sensyArduino,GLED_1,0);
            writeDigitalPin(sensyArduino,GLED_2,0);
            writeDigitalPin(sensyArduino,RLED_1,1);
            writeDigitalPin(sensyArduino,RLED_2,1);
            writeDigitalPin(sensyArduino,YLED,0);
        end
    end
    pause(0.1);
end