clear;
close all;
clc;

% the clt tells you what is the distribution of the average of n random
% variables
% we will vary n from 5 to some large value to demonstrate this
% Note: make sure that you have enough ram on your machine to store a 6000
% x 10000 array!
count = 1;
for n=[5 10 15 50 100 200 500 1000]
    nsamp = 5000; % to plot a histogram we need several samples for the average
    X2 = zeros(nsamp,n);
    
    % our sampling distribution is [0,1] uniform random
    X = rand(nsamp,n); X2(:,:) = 0;
    X2(X <= 0.05) = 1; 
    X2(X > 0.05 & X <= 0.45) = 2; 
    X2(X > 0.45 & X <= 0.6) = 3; 
    X2(X > 0.6 & X <= 0.9) = 4;
    X2(X > 0.9) = 5;
    X = X2; 
    mu = 3; % is the true mean of this distribution (you can check this from \sum_{i=1}^K p_i x_i)
    sig2 = 1.3; % the true variance of this distribution - check this yourself
    
    % this is what is denoted as Y_j in the slides - except that we aren't
    % dividing by sqrt(sig2) there. the distribution of the quantity below
    % should converge to that of the standard normal.
    % in the lecture slides, it should converge to N(0,sig2)
    meanX = mean(X,2);
    
    % we use 50 bins for our histogram
    numbins = 50;
   
    figure(1); hist(meanX,numbins); %minval+stepsize/2:stepsize:maxval-stepsize/2);
    title (sprintf('PDF of the average of %d iid random variables',n));
    
    [f1,x] = ecdf(meanX);
    figure(2); plot(x,f1); hold on; 
    f2 = normcdf(x,mu,sqrt(sig2)/sqrt(n));
    plot(x,f2,'color','red'); hold off;
    
    f3(count) = max(abs(f1-f2));
    count = count+1;
    pause;
end

figure(3); plot([5 10 15 50 100 200 500 1000],f3);
