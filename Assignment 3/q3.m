A=dlmread('XYZ.txt',',');
format long;
x=A(:,1);
y=A(:,2);
z=A(:,3);
[values,s]=size(x);
LHS=zeros(3,3);
LHS(1,1)=dot(x,x);
LHS(2,1)=dot(x,y);
LHS(3,1)=sum(x);
LHS(1,2)=dot(x,y);
LHS(2,2)=dot(y,y);
LHS(3,2)=sum(y);
LHS(1,3)=sum(x);
LHS(2,3)=sum(y);
LHS(3,3)=values;
RHS=zeros(3,1);
RHS(1,1)=dot(x,z);
RHS(2,1)=dot(y,z);
RHS(3,1)=sum(z);
Ans=LHS\RHS;
a=Ans(1);
b=Ans(2);
c=Ans(3);
noise=z-a*x-b*y-c;
noisevar=(sumsqr(noise))/values;
fprintf('The equation of the plane is ax+by+c=z where\n a=%f\n b=%f\n c=%f\n',a,b,c)
fprintf('Predicted Noise Variance is %f\n',noisevar)
