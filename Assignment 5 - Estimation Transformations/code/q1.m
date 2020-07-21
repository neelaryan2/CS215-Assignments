clc(); clear();
rng(0);
N = [5, 10, 20, 40, 60, 80, 100, 500, 10^3, 10^4];
M = 150; mu_true=10; sig_true=4;mu_prior=10.5;
errML = zeros(M, 10);
errMAP1 = zeros(M, 10);
errMAP2 = zeros(M, 10);
i=1;
while i<11
    n = N(i);
    j = 1;
    while j <= M
        X = randn(n,1);
        X = X*sig_true + mu_true;
        mu_ML = mean(X);
        mu_MAP1 = (mu_ML*n + mu_prior*(sig_true^2))/(n + (sig_true^2));
        if(mu_ML < 9.5)
            mu_MAP2 = 9.5;
        elseif mu_ML  < 11.5
            mu_MAP2 = mu_ML;
        else
            mu_MAP2 = 11.5;
        end
        errML(j,i) = abs(mu_ML - mu_true)/mu_true;
        errMAP1(j,i) = abs(mu_MAP1 - mu_true)/mu_true;
        errMAP2(j,i) = abs(mu_MAP2 - mu_true)/mu_true;
        j=j+1;
    end
    i=i+1;
end
figure();
boxplot(errML, 'Colors',"b", 'Notch', 'on');
hold on;
boxplot(errMAP1, 'Colors',"k", 'Notch',"on");
boxplot(errMAP2, 'Colors',"g",'Notch','on', 'Labels',N);
xlabel('N');
ylabel('Relative Error');
title('Q1');
%hLegend = legend(findall(gca,'Tag','Box'), {'ML','MAP1','MAP2'});
L(1) = plot(nan, nan, 'b-');
L(2) = plot(nan, nan, 'k-');
L(3) = plot(nan, nan, 'g-');
legend(L, {'ML', 'MAP1', 'MAP2'});
hold off;
