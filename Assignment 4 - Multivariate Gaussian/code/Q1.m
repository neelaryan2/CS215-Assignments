clc();
rng(0);
N=10;
estimates = zeros(1,8);
[z,cols] = size(estimates);
for i=1:cols
    if N > 10^8
        %[q,r] = quorem(single(N),single(10*7));
        q = floor(N/10000000);
        r = N - q*10000000;
        points =0;
        for j=1:q
            X = rand(2,10^7)*2-1;
            X = single(X);
            points = points + sum(vecnorm(X)<=1);
        end
        X = rand(2,r)*2-1;
        X = single(X);
        points = points + sum(vecnorm(X)<=1);
        frac = points/N;
    else
       X = rand(2,N)*2-1;
        X = single(X);
        points = sum(vecnorm(X)<=1);
        frac = points/N; 
    end
    estimates(1,i) =  4*frac;
    fprintf("Pi estimate for N=%d is %0.5f\n", N, estimates(1,i));
    N = 10*N;
end
%disp;(estimates);
