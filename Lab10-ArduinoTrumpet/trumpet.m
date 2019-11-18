% Note: must do new arduinosetup and make sure ultrasonic is selected
clear;close all;clc;

trumpetArduino = arduino('/dev/ttyUSB0','Uno');

% Define Pins
GREEN_BUTTON = 'D8';
YELLOW_BUTTON = 'D9';
RED_BUTTON = 'D10';
SPEAK_PIN = 'D5' ;
GLED = 'D6';
YLED = 'D7';
RLED= 'D4';
gbutton_state = 0;
ybutton_state = 0;
rbutton_state = 0;
waitTime = 0.25;
n_flash = 5;

while(1) 
    rbutton_state = readDigitalPin(trumpetArduino,RED_BUTTON);
    gbutton_state = readDigitalPin(trumpetArduino,GREEN_BUTTON);
    ybutton_state = readDigitalPin(trumpetArduino,YELLOW_BUTTON);
    
    if rbutton_state == 1
        writeDigitalPin(trumpetArduino,RLED,1);
        for i = 1:n_flash
            writeDigitalPin(trumpetArduino,RLED,0);
            pause(waitTime);
            writeDigitalPin(trumpetArduino,RLED,1);
        end
        while(rbutton_state == 1)
            rbutton_state = readDigitalPin(trumpetArduino,RED_BUTTON);
            playTone(trumpetArduino,SPEAK_PIN,3038,0.1);
        end
        writeDigitalPin(trumpetArduino,RLED,0);
    end
    
    if gbutton_state == 1
        writeDigitalPin(trumpetArduino,GLED,1);
        for i = 1:n_flash
            writeDigitalPin(trumpetArduino,GLED,0);
            pause(waitTime);
            writeDigitalPin(trumpetArduino,GLED,1);
        end
        while(gbutton_state == 1)
            gbutton_state = readDigitalPin(trumpetArduino,GREEN_BUTTON);
            playTone(trumpetArduino,SPEAK_PIN,3400,0.1);
        end
        writeDigitalPin(trumpetArduino,GLED,0);
    end
    
    if ybutton_state == 1
        writeDigitalPin(trumpetArduino,YLED,1);
        for i = 1:n_flash
            writeDigitalPin(trumpetArduino,YLED,0);
            pause(waitTime);
            writeDigitalPin(trumpetArduino,YLED,1);
        end
        while(ybutton_state == 1)
            ybutton_state = readDigitalPin(trumpetArduino,YELLOW_BUTTON);
            playTone(trumpetArduino,SPEAK_PIN,3830,0.1);
        end
        writeDigitalPin(trumpetArduino,YLED,0);
    end
end 