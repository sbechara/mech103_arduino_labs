clear;

FSR_PIN = 'A0';
% If we want to get accurate values we need to measure these things
VCC = 4.98; % Measured voltage of Ardunio 5V line
R_DIV = 9800.0; % Measured resistance of 10k resistor

forceArduino = arduino('/dev/ttyUSB0','Uno'); %arduino();
waitTime = 2;

while(1)
    fsrVoltage = readVoltage(forceArduino, FSR_PIN); % need to confirm this is a true voltage (ADC)
    %If the FSR has no pressure, the resistance will be near infinite. So the voltage should be near 0.
    if fsrVoltage ~= 0 % If the analog reading is non-zero
        %Use voltage and static resistor value to calculate FSR resistance:
        fsrResistance = R_DIV * (VCC / fsrVoltage - 1.0);
        fprintf("Reistance is %f\n",fsrResistance); % print out the resistance
        %Guesstimate force based on slopes in figure 3 of the FSR datasheet:
        fsrConductance = 1.0 / fsrResistance; % Calculate conductance
        %Break parabolic curve down into two linear slopes:
        if (fsrResistance <= 600)
            force = (fsrConductance - 0.00075) / 0.00000032639;
        else
            force =  fsrConductance / 0.000000642857;
        end
        fprintf("\tThe force is %f\n",force); % print out the force
        writeDigitalPin(forceArduino, 'D07', 1);
        writeDigitalPin(forceArduino, 'D06', 0);
        writeDigitalPin(forceArduino, 'D05', 0);
        writeDigitalPin(forceArduino, 'D04', 0);
        writeDigitalPin(forceArduino, 'D03', 0);
        if force > 250
            writeDigitalPin(forceArduino, 'D06', 1);
        end
        if force > 500
            writeDigitalPin(forceArduino, 'D05', 1);
        end
        if force > 1000
            writeDigitalPin(forceArduino, 'D04', 1);
        end
        if force > 2000
            writeDigitalPin(forceArduino, 'D03', 1);
        end
        
        pause(waitTime);
        
    else
        % Turn off all LEDs
        writeDigitalPin(forceArduino, 'D07', 0);
        writeDigitalPin(forceArduino, 'D06', 0);
        writeDigitalPin(forceArduino, 'D05', 0);
        writeDigitalPin(forceArduino, 'D04', 0);
        writeDigitalPin(forceArduino, 'D03', 0);
        pause(waitTime);
        fprintf("No resistance detected\n");
        % No pressure detected
        % So all LEDs off
    end
end

writeDigitalPin(forceArduino, 'D07', 0);
writeDigitalPin(forceArduino, 'D06', 0);
writeDigitalPin(forceArduino, 'D05', 0);
writeDigitalPin(forceArduino, 'D04', 0);
writeDigitalPin(forceArduino, 'D03', 0);