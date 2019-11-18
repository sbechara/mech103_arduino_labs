% lab2_solutions.m
% Created on: 18 July 2018
% Created by: Samuel Bechara, PhD
% STUDENTS MUST INCLUDE HEADER! -2 pts if ommitted

clear
clc
close all

%% Convert from feet to meters
clear
clc
feet = input('Please enter the number of feet to convert to meters: ');
conversion_factor = 0.3048; % 1 foot = 0.3048 meter
meters = feet * conversion_factor;
fprintf('%0.2f feet is %0.2f meters\n',feet,meters);

%% Convert from meters to feet