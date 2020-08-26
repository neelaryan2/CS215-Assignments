clear;
clc;

im1 = double(imread('T1.jpg'));
im2 = double(imread('T2.jpg'));
im2 = 255-im1;
[H,W] = size(im2);
binwidth = 10;

v1 = im1(:)-mean(im1(:));

count = 0;
for tx = -10:1:10
    im3 = zeros(H,W);
    
    if tx >= 0
        im3(:,tx+1:W) = im2(:,1:W-tx);
    else
        im3(:,1:W+tx) = im2(:,abs(tx)+1:W);
    end
    
    v3 = im3(:)-mean(im3(:));
    
    count = count+1;
    cc(count) = abs(dot(v1,v3)/(norm(v1)*norm(v3)));
    
    fprintf ('\n%d %f',tx,cc(count));
    
    p12 = joint_hist(im1(:),im3(:),binwidth);
    p1 = sum(p12,1);
    p2 = sum(p12,2); 
    numbins = length(p1);
    p1p2 = zeros(numbins); 
    for i=1:numbins, for j=1:numbins, p1p2(i,j) = p1(i)*p2(j); end; end;
    QMI12(count) = sum(sum( (p12-p1p2).^2));
    fprintf (' %f',QMI12(count));
end

plot(-10:10,cc);
figure; plot(-10:10,QMI12);

