clear

motorArduino = arduino('COM3','Uno','Libraries','Servo');

% Hookup Guide
% Servo | Arduino
% Black | GND
% Red   | +5V
% White | D9

s = servo(motorArduino,'D9');

% Now you can read and write values to motor
% Example loop that moves to a couple different angles

for angle = 0:0.2:1
    writePosition(s,angle);
    current_pos = readPosition(s);
    current_pos = current_pos*180;
    fprintf('Current motor position is %d degrees\n',current_pos);
    pause(1);
end