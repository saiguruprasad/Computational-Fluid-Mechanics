clear
n=input('Enter the number of Comtrol Volume elements to be placed : ');
l=input('Enter the length of the bar : ');
% k=input('Enter the thermal conductivity of the rod : ');
% A=input('Enter the area of the rod : ');
dx=l/(n);
tl=input('Enter the value at the left most boundary : ');
% tr=input('Enter the value at the right most boundary : ');
ta=input('Enter the ambient temperature : ');
nh=input('Enter the (hP)/(kA) value : ');
T=zeros(n,n);
r1=1/(dx/2); r=1/dx;
for i=2:n-1
    for j=i-1:i+1
        if (j==i-1)
            T(i,j)=-r;
        elseif (j==i)
            T(i,j)=r+r+(nh*dx);
        else
            T(i,j)=-r;
        end
    end
end
T(1,1)=r+(nh*dx)+r1; T(n,n)=r+(nh*dx);
T(1,2)=-r; T(n,n-1)=-r;
B=(nh*dx*ta)*ones(n,1);
B(1,1)=(r1*tl)+(nh*dx*ta); B(n,1)=(nh*dx*ta);
t=T\B