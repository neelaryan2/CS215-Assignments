clear;
clc;

n = 100;
for i=1:n
   Hn(i) = sum(1./(1:i)); 
   Gn(i) = log(i);
end

plot(1:n,Hn);
hold on; plot(1:n,Gn,'color','red');
hold on; plot(1:n,2*Gn,'color','green');
