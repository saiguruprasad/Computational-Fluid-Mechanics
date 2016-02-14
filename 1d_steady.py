# -*- coding: utf-8 -*-
"""
Created on Mon Feb 01 10:55:29 2016

@author: Sai Guruprasad
"""

from __future__ import division
import numpy as np

t1=eval(raw_input('Enter the temperature at x=0 : '));
t2=eval(raw_input('Enter the temperature at x=L :  ')); 
ti=eval(raw_input('Enter the intital temperature to be assumed at the nodes :  '));
n=eval(raw_input('Enter the number of nodes to be present in between the boundaries : '));
r=eval(raw_input('Enter the residue value : '));
a=np.zeros([0,n+2]); f=1; A=[]; d=[];
A.append(t1); b=[ti]*n; A=A+b; A.append(t2);
c=np.asarray(A).reshape(1,n+2);
a=np.append(a,c,axis=0); k=1;
while (f!=0):
    d.append(t1);
    i=0; j=1;
    for i in range(n):
        d.append((d[i]+A[i+2])/2);
    d.append(t2);
    b=np.max(np.abs(list(np.array(d)-np.array(A))));
    if b<r:
        f=0;
    else:
        f=1;       
    A=d;
    c=np.asarray(A).reshape(1,n+2);
    a=np.append(a,c,axis=j);
    d=[];
    i=i+1;
    j=j+1; k=k+1;
a=np.reshape(a,(k,n+2));