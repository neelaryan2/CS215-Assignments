clc();
rng(0);
N = [10 100 1000 10000 100000];
C = [1.6250 -1.9486; -1.9486 3.8750];
mu = [1 ; 2];
mu_errors = zeros(100,5);
C_errors = zeros(100,5);
[V, D] = eig(C);
S = sqrt(D);
A = V*S;
for ni = 1:5
    for i=1:100
        W = randn(2,N(ni));
        X = A*W + mu;
        mu_hat = mean(X,2);
        mu_errors(i,ni) = norm(mu-mu_hat)/norm(mu);
        C_hat = A*(W*transpose(W)/N(ni))*transpose(A);
        C_errors(i,ni) = norm(C-C_hat, 'fro')/norm(C, 'fro');
        if i==1
            figure;
            scatter(X(1,:), X(2,:));
            hold on;
            p1 = mu + D(1,1)*V(:,1)/norm(V(:,1));
            p2 = mu + D(2,2)*V(:,2)/norm(V(:,2));
            vals = [p1 mu p2];
            plot(vals(1,:), vals(2,:), 'Linewidth',2);
            xlabel('X1');
            ylabel('X2');
            title(sprintf('N = %d',N(ni)));
        end
    end
end
figure;
boxplot(mu_errors);
title('Mean error');
xlabel('log(N)');

figure;
boxplot(C_errors);
title('Covariance error');
xlabel('log(N)');