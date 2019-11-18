% Make sure to remove the arduino object from workspace
clear

% Setup Arduino
spicyArduino = arduino();
tmp36Pin = 'A0';

% Enter in how long you want to take reading for in seconds
readTime = 10;

% Enter in how long you want the delay to be between readings
delayTime = 0.75;

% Calculate integer value for data points
dataPoints = ceil((readTime*(1/delayTime)));

initialTemp = pinReadToTemp(readVoltage(spicyArduino,tmp36Pin));

temperature = ones(1,dataPoints)*initialTemp;
timePoints = 1:length(temperature);
tempPlot = plot(timePoints,temperature,'r*--');
xlabel('Data Points');
ylabel('Temp C');

set(tempPlot,'XDataSource','timePoints');
set(tempPlot,'YDataSource','temperature');

for i = 1:dataPoints
    temperature(i)=pinReadToTemp(readVoltage(spicyArduino,tmp36Pin));
    disp(temperature(i));
    refreshdata
    pause(delayTime);
end

function temp = pinReadToTemp(reading)
temp = (reading - 0.5) * 100;
end