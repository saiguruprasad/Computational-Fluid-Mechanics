clc;
clear all;
close all;
A=[]; b=[];
t1=input('Enter the boundary condition at x=0 : ');
t2=input('Enter the boundary condition at x=L : ');
ti=input('Enter the initial value to be assumed : ');
dt=input('Enter the time step value : ');
tn=input('Enter the number of timesteps to be calculated : ');
n=input('Enter the number of nodes to be placed between the ends of the rod :');
le=input('Enter the length of the rod : ');
alpha=input('Enter the thermal diffusivity of the material : ');
A(1,1)=t1; A(1,n+2)=t2; A(1,2:n+1)=ti; dx=le/(n+1);
i=2; f=1;
for f=1:tn
    c=0; 
    A(i,1)=A(i-1,1);
    for j=2:n+1
        A(i,j)=((alpha*dt)/(dx^2))*(A(i-1,j+1)+A(i-1,j-1)) + (1-((2*alpha*dt)/dx^2))*A(i-1,j);
    end
    A(i,n+2)=A(i-1,n+2);

    i=i+1;
end
A
% x=linspace(
% plot(x,A(:,3))