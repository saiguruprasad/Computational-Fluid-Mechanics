clc;
clear all;
close all;
A=[]; b=[];
tx1=input('Enter the boundary condition at x=0 : ');
tx2=input('Enter the boundary condition at x=L : ');
ty1=input('Enter the boundary condition at y=0 : ');
ty2=input('Enter the boundary condition at y=L : ');
ti=input('Enter the initial value to be assumed : ');
r=input('Enter the residue value to check the value : ');
nx=input('Enter the number of nodes to be placed between the ends of the rod in x :');
ny=input('Enter the number of nodes to be placed between the ends of the rod in y :');
A(1:nx+2,1,1)=tx1; A(1:nx+1,ny+2,1)=tx2; A(1,2:ny+1,1)=ti;
A(nx+2,1:ny+2,1)=ty1; A(1,1:ny+2,1)=ty2; A(2:nx+1,2:ny+1,1)=ti;
i=2; f=1;
while f~=0
    c=0;
    A(1:nx+2,1,i)=A(1:nx+2,1,i-1); A(1:nx+2,ny+2,i)=A(1:nx+2,ny+2,i-1);
    for j=2:nx+1
        for j2=2:ny+1
            A(j,j2,i)=(A(j,j2-1,i)+A(j,j2+1,i-1)+A(j-1,j2,i)+A(j+1,j2,i-1))/4;
        end
    end
%     A(i,2)=(A(i,1)+A(i-1,3))/2;
%     A(i,3)=(A(i,2)+A(i-1,4))/2;
%     A(i,4)=(A(i,3)+A(i-1,5))/2;
    A(1,1:nx+2,i)=A(1,1:ny+2,i-1); A(nx+2,1:ny+2,i)=A(nx+2,1:ny+2,i-1);
    for k=2:nx+1
        for k2=2:ny+1
            l=1; l1=1;
            b(l,l1)=[(A(k,k2,i)-A(k,k2,i-1))];
            l=l+1;
        end
        l1=l1+1;
    end
    c=max(abs(b));
    if c<r
        f=0;
    else
        f=1;
    end
    i=i+1;
end