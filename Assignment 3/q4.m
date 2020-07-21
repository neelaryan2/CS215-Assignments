S = 4*randn(1,1000);
p = randperm(1000);
l = 750;
T = S(p(1:l));
V = S(p((l+1):1000));
sig = [0.001, 0.1, 0.2, 0.9, 1, 2, 3, 5, 10, 20, 100];
pl=[];
for si = sig
    temp=[];
    for v = V
        x = ((v-T).^2);
        al = log(sum(exp(-x/(2*si^2))));
        temp = [temp al];
    end
   
    pl = [pl sum(temp)-(1000-l)*log(l*si*sqrt(2*pi))];
end
plot(log(sig), pl);
title('LL vs log(sigma)');
[val, pos] = max(pl);
fprintf('Best LL is given for sigma = %0.3f\n', sig(pos));
pl=[];
for si=sig
    temp = [];
    for v=V
        ph = sum(exp(-((v-T).^2)/(2*si^2)))/(l*si*sqrt(2*pi));
        x = (exp(-v^2/32)/(4*sqrt(2*pi)) - ph)^2;
        temp = [temp x];
    end
    pl = [pl sum(temp)];
end
figure;
plot(log(sig), pl);
title('D vs log(sigma)');
[v,po] = min(pl);
fprintf('Best D is given for sigma = %.3f\n', sig(po));
fprintf('D value for sigma giving best LL = %.5f\n', pl(pos));