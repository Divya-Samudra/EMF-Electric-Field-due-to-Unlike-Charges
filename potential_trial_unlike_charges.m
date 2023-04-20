clc;
clear;
%Program to calculate Electric Field Intensity E=-del(V)
%Consider two equal and opposite point charge Q=+/-1C at origin(0,0)and (0,0.4)
%Potential function is V=(9e9*Q)/r;
%r is the distance from the point charge, where V is calculated
% r=sqrt(x^2+y^2)
[x,y] = meshgrid(-1:.08:1, -1:.08:1);  %x-y plane of (-1,1) to (-1,1)with 26x26 points
% Calculating distance function r=sqrt(x^2+y^2) and potential function.
% x, y, r, V, E are matrices of size(26x26)
size_x=size(x,1);
for i=1:size_x
    for j=1:size_x
    r(i,j)=sqrt(x(i,j)^2+y(i,j)^2);% distance
    r1(i,j)=sqrt((x(i,j)-0.4)^2+(y(i,j))^2);
    V(i,j)=9e9/r(i,j);% potential V at various r
    V1(i,j)=-9e9/r1(i,j);
    end
end
V_eff=V+V1;
figure(1)
surf(x,y,V_eff); %value of V(z axis) at various(x,y)-within (-1,1), (-1,1)
title('Absolute potential wrt x-y plane due to equal point charges at (0,0) and (0,0.4)');
figure(2)
[Ex,Ey]=gradient(V);%Electric field intensity at various points
[Ex1,Ey1]=gradient(V1);
Ex=Ex*(-1); %E in the direction of unit vector ax
Ex1=Ex1*(-1);
Ey=Ey*(-1);
Ey1=Ey1*(-1); %E in the direction of unit vector ay
E=sqrt(Ex^2+Ey^2); % magnitude of E at various points
Ex_eff=Ex+Ex1;
Ey_eff=Ey+Ey1;
contour (x,y,V_eff); %equipotential countour wrt x-y plane
hold on;
%contour (x,y,V1);
%hold on;
quiver(x,y,Ex_eff,Ey_eff); %Variation of potential
%hold on;
%quiver(x,y,Ex1,Ey1);
title('Equipotential contour and voltage gradient');
