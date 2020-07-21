[r,c,t]=size(imread('../data/data_fruit/image_1.png'));
n=16; n_vecs=4; n_val=10; n_plots=4; n_rand=3;
images=zeros(r,c,t,n);
mean=zeros(r,c,t);
for i=1:n
    loc=strcat('../data/data_fruit/image_',int2str(i),'.png');
    images(:,:,:,i)=double(imread(loc));
    mean=mean+images(:,:,:,i);
end
mean=mean/n;

cov=zeros(r*c*t,r*c*t);
A=zeros(n,r*c*t);
for i=1:n
    A(i,:)=reshape(images(:,:,:,i)-mean,1,r*c*t);
end
cov=(transpose(A)*A)/n;

[vecs,values]=eigs(cov,max(n_vecs,n_val));
vecs=vecs(:,1:n_vecs);
values=diag(values);
A=zeros(r*c*t,n_vecs);
for i=1:n_vecs
   A(:,i)=sqrt(values(i))*vecs(:,i);
end
vecs=reshape(vecs,r,c,t,n_vecs);

figure(1);
subplot(3,2,[1,2]); imshow(res(mean)); title('Mean');
for i=1:n_plots
    subplot(3,2,i+2); 
    imshow(res(vecs(:,:,:,i))); 
    title(strcat('Eigenvector-',int2str(i)));
end

figure(2);
plot(values);
title(strcat('Top ',int2str(n_val),' Eigenvalues'));
xlabel('Index');
ylabel('Eigenvalue');
hold on;
scatter(1:n_val,values);
hold off;

for i=1:n
    figure(i+2);
    subplot(1,2,1); imshow(res(images(:,:,:,i))); title(strcat('Original Image - ',int2str(i)));
    img=approx(images(:,:,:,i),mean,vecs);
    subplot(1,2,2); imshow(res(img)); title('Approximation');
end

rng(4);
for i=1:n_rand
    ran=round(reshape(A*randn(n_vecs,1),r,c,t)*255)+mean;
    figure(n+2+i);
    subplot(1,2,1); imshow(res(ran)); title('Random Sample');
end

function y = res(x)
    [l,m,n]=size(x);
    y=zeros(l,m,n);
    for k=1:n
        y(:,:,k)=rescale(x(:,:,k));
    end
end

function img = approx(imag,mean,vecs)
    img=mean;
    [r,c,t,n_vecs]=size(vecs);
    coeff=zeros(n_vecs,1);
    for j=1:n_vecs
        coeff=dot(reshape(imag-mean,1,r*c*t),reshape(vecs(:,:,:,j),1,r*c*t));
        img=img+coeff*vecs(:,:,:,j);
    end
end