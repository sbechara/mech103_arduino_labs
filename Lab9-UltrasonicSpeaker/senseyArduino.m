clear; clc;

trigPin = 'D13';
echoPin = 'D8';
speakPin = 'D12';
LEDRed1 = 'D2';
LEDRed2 = 'D4';
LEDYel = 'D5';
LEDGrn1 = 'D6';
LEDGrn2 = 'D7';

myDuino = arduino('/dev/ttyUSB0','uno','libraries','ultrasonic');

ultraSensor = ultrasonic(myDuino,trigPin,echoPin);

playTone(myDuino,speakPin,440,1);

for j=1:5
    distance = readDistance(ultraSensor);
    fprintf("Distance is %f\n",distance);
    writeDigitalPin(myDuino, LEDRed1, 0);
    writeDigitalPin(myDuino, LEDRed2, 0);
    writeDigitalPin(myDuino, LEDYel, 0);
    writeDigitalPin(myDuino, LEDGrn1, 0);
    writeDigitalPin(myDuino, LEDGrn2, 0);
    if distance == Inf
        writeDigitalPin(myDuino, LEDRed1, 0);
        writeDigitalPin(myDuino, LEDRed2, 1);
        writeDigitalPin(myDuino, LEDYel, 0);
        writeDigitalPin(myDuino, LEDGrn1, 1);
        writeDigitalPin(myDuino, LEDGrn2, 0);
    end
    if distance > 0.25
        writeDigitalPin(myDuino, LEDRed1, 1);
    end
    if distance > 0.5
        writeDigitalPin(myDuino, LEDRed1, 1);
        writeDigitalPin(myDuino, LEDRed2, 1);
    end
    if distance > 1
        writeDigitalPin(myDuino, LEDRed1, 1);
        writeDigitalPin(myDuino, LEDRed2, 1);
        writeDigitalPin(myDuino, LEDYel, 1);
    end
    if distance > 1.25
        writeDigitalPin(myDuino, LEDRed1, 1);
        writeDigitalPin(myDuino, LEDRed2, 1);
        writeDigitalPin(myDuino, LEDYel, 1);
        writeDigitalPin(myDuino, LEDGrn1, 1);
    end
    if distance > 1.5
        writeDigitalPin(myDuino, LEDRed1, 1);
        writeDigitalPin(myDuino, LEDRed2, 1);
        writeDigitalPin(myDuino, LEDYel, 1);
        writeDigitalPin(myDuino, LEDGrn1, 1);
        writeDigitalPin(myDuino, LEDGrn2, 1);
    end
    pause(1);
end

disp("Playing sound");
playTone(myDuino,speakPin,440,1);
disp("Done playing sound");