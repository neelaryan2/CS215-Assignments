clear;
clc;

N = 2000;
gs = 4; 
y = randn(1,N)*gs;

sigmas = [0.001 0.1 0.2 0.9 1 2 3 5 10 20 100];
len = length(sigmas);

indices = randperm(N);
val_indices = indices(1:ceil(N/4)); nv = length(val_indices);
train_indices = indices(ceil(N/4)+1:N); nt = length(train_indices);
val_indices = train_indices;

density_val = zeros(1,nv); ground_truth_density_val = density_val;
log_likelihood = zeros(1,len); diff_ground_truth = log_likelihood;

for i=1:len
    density_val(:) = 0;
    for j=1:nv
       density_val(j) = mean(exp(-(y(val_indices(j))-y(train_indices)).^2/(2*sigmas(i)*sigmas(i))))/(sigmas(i)*sqrt(2*pi));
       ground_truth_density_val(j) = exp(-(y(val_indices(j)))^2/(2*gs*gs))/(gs*sqrt(2*pi));
    end
    log_likelihood(i) = mean(log(density_val));
    diff_ground_truth(i) = sum((density_val-ground_truth_density_val).^2);
end
figure(1); plot(log(sigmas),log_likelihood); 
figure(2); plot(log(sigmas),diff_ground_truth);
[maxval,maxind] = max(log_likelihood);
fprintf('\nbest sigma = %f, corresp log likelihood = %f',sigmas(maxind),log_likelihood(maxind));
[minval,minind] = min(diff_ground_truth);
fprintf('\nbest sigma = %f, corresp difference = %f, corresp difference at maxind = %f',sigmas(minind),diff_ground_truth(minind),diff_ground_truth(maxind));



