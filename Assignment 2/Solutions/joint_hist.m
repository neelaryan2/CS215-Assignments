function p12 = joint_hist(X1,X2,binwidth)

n = length(X1);

X1 = floor(X1/binwidth)+1;
X2 = floor(X2/binwidth)+1;

numbins = ceil((255-0)/binwidth);

p12 = zeros(numbins);
for i=1:n
    p12(X1(i),X2(i)) = p12(X1(i),X2(i)) + 1;
end
p12 = p12/sum(p12(:));