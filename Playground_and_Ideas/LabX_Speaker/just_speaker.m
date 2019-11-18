% just speaker
clear
speaker = arduino('/dev/ttyUSB0','uno');

for tone = 0:.1:1
    writePWMDutyCycle(speaker,'D9',tone);
    pause(0.25);
end
