clear;
clc;
p = [5,10,15,20,30,40,50,60,70,80,90,95,99,99.99,99.9999,100]/100;
count = 1;

for n=10:1:365
    val = 1-prod(365:-1:365-n+1)/(365^n);    
    if val >= p(count)
        if count == 15, 
            aa = 1; 
        end;
        final_n(count) = n;
        fprintf('\n%d %f',n,p(count));
        count = count+1;
        if count > length(p), break; end;
    end
end

plot(p,final_n);