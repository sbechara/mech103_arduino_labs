% speaker and button
clear

speaker = arduino('/dev/ttyUSB0','uno');


buttonPin = 'D2';

while(1)
    buttonState = readDigitalPin(speaker,buttonPin);
    disp(buttonState);
end