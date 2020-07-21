clc(); clear();
rng(0);
N = [5, 10, 20, 40, 60, 80, 100, 500, 10^3, 10^4];
M = 150; i=1;
lam_true = 5;
alpha = 5.5; beta = 1;
errML = zeros(M,10);
errBay = zeros(M,10);
while i<11
    j=1; n = N(i);
    while j<=M
        X = rand(n,1);
        Y = -log(X)/lam_true;
        lam_ML = 1/mean(Y);
        lam_Bay = (alpha + n)/(beta + n/lam_ML);
        errML(j, i) = abs(lam_ML - lam_true)/lam_true;
        errBay(j, i) = abs(lam_Bay - lam_true)/lam_true;
        j = j+1;
    end
    i=i+1;
end
figure();
boxplot(errML, 'Colors',"b", 'Notch', 'on');
hold on;
boxplot(errBay, 'Colors',"g", 'Notch',"on", 'Labels',N);
xlabel('N');
ylabel('Relative Error');
title('Q2');
L(1) = plot(nan, nan, 'b-');
L(2) = plot(nan, nan, 'g-');
legend([L(1);L(2)], {'ML', 'Posterior Mean'});
hold off;
