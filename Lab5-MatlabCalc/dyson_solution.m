% dyson_solution.m
% Date created: 30 Sept 2019
% By: Joshua Christopher
% Note: Students do NOT need a commented header for this particular
% assignment. It WILL be required for future assignments.

clear

stefanBoltzmann = 5.67e-8; % Converted to W/(m^2-K^4)
emissivity = 0.95;
areaSunKmSq = 6.09e12; % km^2
areaSunMeterSq = areaSunKmSq*1e6; % now in m^2
temperatureSun = 5778; % K
temperatureDyson = 263.15; % K

% This gives us the answer in Watts
netEnergyTransfer = emissivity*stefanBoltzmann*areaSunMeterSq*(temperatureSun^4-temperatureDyson^4);

secondsPerDay = 60*60*24;

energyPerDay = netEnergyTransfer*secondsPerDay;
fprintf("Energy per day is: %.2e Joules\n",energyPerDay);


transferInKiloWatts = netEnergyTransfer/1000;
kWHalfHour = transferInKiloWatts*60*30;
rateInDollars = 0.11; % $/kWh
hoursToYotta = rateInDollars*transferInKiloWatts/(1e24);
secondsToYottaDolla = hoursToYotta*60*60;
fprintf("It takes %f seconds to get to one yottaDolla\n",secondsToYottaDolla);
%money = rateInDollars*kWHalfHour