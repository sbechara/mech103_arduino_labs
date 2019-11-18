clear

force_arduino = arduino('/dev/ttyUSB0','uno');

VCC = 5; % Voltage of the arduino 5V line
R_DIV = 10000; % Resistance of the 10k resistor

while(1)
    reading = readVoltage(force_arduino,'A0');
    fsr_resistance = R_DIV * (VCC / reading - 1.0);
    fsr_conductance = 1 / fsr_resistance;
    
    % stolen from the Arudino code. Not confirmed to be correct as of July
    % 2019
    if fsr_resistance <= 600
        force = (fsr_conductance - - 0.00075) / 0.00000032639;
    else
        force = fsr_conductance / 0.000000642857;
    end
    
    
    %disp(force);
    fprintf('Force = %d, Resistance = %d\n',force,fsr_resistance);
    
    pause(0.5);
    
end