% speaker and button
clear;close all;clc;

speaker = arduino('/dev/ttyUSB0','uno');

greenButtonPin = 'D10';
yellowButtonPin = 'D9';
redButtonPin = 'D8';
speakerPin = 'D6';

% Initialize button state to 0 so loop starts
redButtonState = 0;

% Define frequency of notes for hot cross buns
B = 3951;
A = 3520;
G = 3135;

% loop continues until red button is pressed
while(redButtonState ~= 1)
    greenButtonState = readDigitalPin(speaker,greenButtonPin);
    yellowButtonState = readDigitalPin(speaker,yellowButtonPin);
    redButtonState = readDigitalPin(speaker,redButtonPin);
    
    if greenButtonState == 1 && yellowButtonState == 1
        playTone(speaker,speakerPin,A,0.1)
    elseif greenButtonState == 1
        playTone(speaker,speakerPin,B,0.1)
    elseif yellowButtonState == 1
        playTone(speaker,speakerPin,G,0.1)
    else
        tone = 0;
    end
    
end