clc;
clear all;
close all;
A=[]; b=[];
t1=input('Enter the boundary condition at x=0 : ');
t2=input('Enter the boundary condition at x=L : ');
ti=input('Enter the initial value to be assumed : ');
r=input('Enter the residue value to check the value : ');
n=input('Enter the number of nodes to be placed between the ends of the rod :');
A(1,1)=[t1]; A(1,n+2)=t2; A(1,2:n+1)=ti;
i=2; f=1;
while f~=0
    c=0;
    A(i,1)=A(i-1,1);
    for j=2:n+1
        A(i,j)=(A(i,j-1)+A(i-1,j+1))/2;
    end
%     A(i,2)=(A(i,1)+A(i-1,3))/2;
%     A(i,3)=(A(i,2)+A(i-1,4))/2;
%     A(i,4)=(A(i,3)+A(i-1,5))/2;
    A(i,n+2)=A(i-1,n+2);
    l=1;
    for k=2:n
        b(l)=[(A(i,k)-A(i-1,k))];
        l=l+1;
    end
    c=max(abs(b));
    if c<r
        f=0;
    else
        f=1;
    end
    i=i+1;
end
x=linspace(1,i-1,i-1);
y=A(1:i-1,3);
plot(x,y);
y=b;
plot(x,y);