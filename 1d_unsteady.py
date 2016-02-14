# -*- coding: utf-8 -*-
"""
Created on Thu Jan 28 15:33:56 2016

@author: Sai Guruprasad
"""
from __future__ import division
import numpy as np

t1=eval(raw_input('Enter the temperature at x=0 : '));
t2=eval(raw_input('Enter the temperature at x=L :  ')); 
ti=eval(raw_input('Enter the intital temperature to be assumed at the nodes :  '));
n=eval(raw_input('Enter the number of nodes to be present in between the boundaries : '));
le=eval(raw_input('Enter the length of the rod : '));
dt=eval(raw_input('Enter the time step : '));
tn=eval(raw_input('Enter the number of time steps to be calculated : '));
alpha=eval(raw_input('Enter the thermal diffusivity of the material : '));
#a=np.zeros((n+2,n+2));
a=np.zeros([tn+1,n+2]); f=0; dx=le/n;
a[:,0]=t1; a[:,n+1]=t2; a[0:tn,1:n+1]=ti; i=1; j=1;
for f in range(tn):
    c=0; 
#    A(i,1)=A(i-1,1);
    j=1;
    for j in range(1,n+1):
        a[i,j]=((alpha*dt)/(dx**2))*(a[i-1,j+1]+a[i-1,j-1]) + (1-((2*alpha*dt)/dx**2))*a[i-1,j];
#    A(i,n+2)=A(i-1,n+2);
    i=i+1;  
print a