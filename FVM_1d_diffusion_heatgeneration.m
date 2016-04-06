n=input('Enter the number of Comtrol Volume elements to be placed : ');
l=input('Enter the length of the bar : ');
k=input('Enter the thermal conductivity of the rod : ');
A=input('Enter the area of the rod : ');
dx=l/(n);
tl=input('Enter the value at the left most boundary : ');
tr=input('Enter the value at the right most boundary : ');
q=input('Enter the heat generated per unit volume : ');
T=zeros(n,n);
r1=(k*A)/(dx/2); r=(k*A)/dx;
for i=2:n-1
    for j=i-1:i+1
        if (j==i-1)
            T(i,j)=-r;
        elseif (j==i)
            T(i,j)=r+r;
        else
            T(i,j)=-r;
        end
    end
end
T(1,1)=r1+r; T(n,n)=r1+r;
T(1,2)=-r; T(n,n-1)=-r;
B=(q*A*dx)*ones(n,1);
B(1,1)=(r1*tl)+(q*A*dx); B(n,1)=(r1*tr)+(q*A*dx);
t=T\B