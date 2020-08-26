clear; clc;

N = 2000;
X = 100*rand(N,1);
Y = 100*rand(N,1);
sigma = 5;
a = 10;
b = 20;
c = 30;
Z = a*X + b*Y + c + randn(N,1)*sigma;

XYZ = [X Y ones(N,1)];
abc = XYZ'*XYZ\(XYZ'*Z);


