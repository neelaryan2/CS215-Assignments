
pr = [5 10 15 20 30 40 50 60 70 80 90 95 99 99.99 99.9999 100];
nr = pr;

for j=1:length(pr)
    given_prob = 1 - (pr(j) / 100);
    ans = 1;
    prob = 1;
    while prob > given_prob
        ans = ans + 1;
        prob = prob * (366 - ans) / 365;
    end
    nr(j) = ans;
end
nr
n = 1:366;
p = n;
for i = 2:366
    p(i) = p(i-1) * (366 - i) / 365;
end
plot(1-p,n)
hold on
xlabel('p')
ylabel('n')
title('Graph for Q7.')