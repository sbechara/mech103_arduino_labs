% LAB 5 Dyson Solution
% Created by: Samuel Bechara
% On: 7 Oct 2019

A = 6.09 * 10^(12) * (1000)^2; % convert to m
T_sun = 5778; %kelvin
T_dyson = 263.15; %kelvin
epsilon = 0.95;
sigma = 5.67*10^(-8);

Q_e = epsilon * sigma * A * (T_sun^4 - T_dyson^4); % Watts

% Calculate total energy per day
energyPerDay = Q_e*24*3600;

% How many seconds to get $10^24 if $0.11/KWh

% First question, how many joules in 1 kwh?
j_per_kwh = (1000)*(3600);

% How many joules in $10^24 @ $0.11/kwh?
j_per_yotta = ((10^24)*j_per_kwh)/(0.11);

% Now can answer...
secondsToYottaDolla = j_per_yotta/Q_e