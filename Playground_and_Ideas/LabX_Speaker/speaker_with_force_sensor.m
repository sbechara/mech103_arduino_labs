clear
speaker_arduino = arduino('/dev/ttyUSB0','uno');

speakerPin = 'D9';
forcePin = 'A0';

while(1)
    fsr_reading = readVoltage(speaker_arduino,forcePin);
    tone = fsr_reading/5;
    writePWMDutyCycle(speaker_arduino,speakerPin,tone);
    pause(0.1);
end
    