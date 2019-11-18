%Convert voltage reading to force for using 10 k resistors
%Data points read from graph at https://cdn.sparkfun.com/datasheets/Sensors/ForceFlex/2010-10-26-DataSheet-FSR400-Layout2.pdf

clc; clear; close all;
%Part I - linear curve fit
vout1 = [0.3 0.9 1.4 1.75 2.2 2.5]; %2.5 2.75 3.0 3.1 3.4 3.45]; %voltage in v
force1 = [25 25 45 100 200 310]; %310 450 565 715 900 1000]; %force in (grams?)
p1 = polyfit(force1,vout1,1); %find polynomial coefficients
ff1 = linspace(min(force1), max(force1));
v1 = polyval(p1,ff1);
plot(force1,vout1,'r*',ff1,v1,'b')
hold on;
%Equation1: Vout = p1(F)*Force + p(2);  Force < 300 g
%           Vout = 0.0063*Force + 0.767; Force < 300 g
%           g - grams
%%
% %Part II - linear curve fit
vout2 = [2.5 2.75 3.0 3.1 3.4 3.45]; %voltage in v
force2 = [310 450 565 715 900 1000]; %force in (grams?)
p2 = polyfit(force2, vout2, 1); %find polynomial coefficients
ff2 = linspace(min(force2), max(force2));
v2 = polyval(p2,ff2);
plot(force2,vout2,'r*',ff2,v2,'b')
polyval(p2,500); grid on; xlabel('Force (g)'); ylabel('Vou (V)'); title('10k Resistor for FSR')
%Equation2: Vout = p1(F)*Force + p(2);  300 g < Force < 1000 g
%           g - grams

%           Vout = 0.00137*Force + 2.132; 300 g < Force < 1000 g
