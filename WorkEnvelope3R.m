clc;clear;
% declaration of arrays
X3=[];
Y3=[];

% INPUT-------------------------------------

% Link 1
L1 = 3; %length of link
a1_min= -140; %minimal angle of first joint
a1_max= +140; %maximal angle of first joint

% Link 2
L2 = 1;
a2_min= -150;
a2_max= +150;

% Link 3
L3 = 1;
a3_min= -120;
a3_max= +120;

% Number of steps (number of points in n^3)
n=20;


% CALCULATION-------------------------------------

for a1 = linspace(a1_min,a1_max,n) %cycle trough all possible angles  
    for a2 = linspace(a2_min,a2_max,n)
        for a3 = linspace(a3_min,a3_max,n)
            X3(end+1)= L1*cos(a1*pi/180) + L2*cos((a1+a2)*pi/180) + L3*cos((a1+a2+a3)*pi/180); %push value to array
            Y3(end+1)= L1*sin(a1*pi/180) + L2*sin((a1+a2)*pi/180) + L3*sin((a1+a2+a3)*pi/180); %push value to array
        end
    end
end


% OUTPUT-------------------------------------

fprintf("%i points have been drawn",length(X3))

hold off; %new graph
scatter(X3,Y3); %draw a points that arm reached
hold on; %add graph
plot(0, 0, 'ro', 'MarkerSize', 10); %robot base

axis equal %height/width ratio to 1:1
grid on
grid minor

