clear;
clc;

x = -3:0.02:3;
y = (5*cos(2.2*x+pi/3));
n = length(y);

cm = ceil(0.6*n); % number of corrupted indices

rand_indices = randperm(n);
rand_indices = rand_indices(1:cm);
z = y;

%z(rand_indices) = z(rand_indices) + 5*rand(1,40)+5;
z(rand_indices) = z(rand_indices) + 100*rand(1,cm)+20;

w = z;
w2 = z;
for i=1:n
    neigh_indices = max([1,i-8]):min([n,i+8]);
    w(i) = median(z(neigh_indices));    
    w2(i) = mean(z(neigh_indices));
    w3(i) = quantile(z(neigh_indices),0.25);
end

plot(x,y,'b',x,z,'r',x,w,'k',x,w2,'g',x,w3,'c');
legend('original','corrupted','median filtered','mean filtered','quantile filtered');
fprintf ('\nMSE with median = %f, with mean = %f, with quantile = %f',mean((w-y).^2)/mean(y.^2),mean((w2-y).^2/mean(y.^2)),mean((w3-y).^2/mean(y.^2)));
