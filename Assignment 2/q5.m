mad = [];
N = [5, 10, 20, 50, 100, 200, 500, 1000, 5000, 10000];
for n = N;
    avgs = zeros(1,1000);
    for p = 1:1000,
        s = 0;
        i=0;
        while i < n,
            temp = rand;
            if temp <= 0.05,
                val = 1;
            elseif temp <= 0.45,
                val = 2;
            elseif temp <= 0.6,
                val = 3;
            elseif temp <= 0.9,
                val = 4;
            else 
                val = 5;
            end
            s = s+ val;
            i = i+1;
        end
        s = s/n;
        avgs(p) = s;
    end
    hist(avgs, 50);
    title(sprintf('N=%d' , n)); 
    pause;
    [f, X] = ecdf(avgs);
    plot(X,f);
    title(sprintf('N=%d', n));
    hold on;
    arr = normcdf(X, mean(avgs), std(avgs));
    plot(X,arr);
    legend('ECDF', 'NORMCDF');
    pause;
    hold off;
    mad = [mad max(abs(arr-f))];
end
plot(N, mad);
ylabel('MAD');
xlabel('N');