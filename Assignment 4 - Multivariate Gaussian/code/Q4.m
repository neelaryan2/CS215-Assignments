load('../data/mnist.mat');
digs=double(digits_train);
labs=double(labels_train);
[r,c,n]=size(digs);
counts=zeros(1,10);
means=zeros(r,c,10);

for i=1:n
    counts(labs(i)+1)=counts(labs(i)+1)+1;
    means(:,:,labs(i)+1)=means(:,:,labs(i)+1)+digs(:,:,i);
end

covs=ones(r*c,r*c,10);
lams=ones(r*c,1,10);
vecs=ones(r,c,1,10);

for i=1:10
    means(:,:,i)=means(:,:,i)/counts(i);
end

for i=1:10
    ind=0;
    A=zeros(counts(i),r*c);
    for j=1:n
        if labs(j)==i-1
            ind=ind+1;
            A(ind,:)=reshape(digs(:,:,j)-means(:,:,i),r*c,1);
        end
    end
    covs(:,:,i)=(transpose(A)*A)/counts(i);
end

for i=1:10
    [V,D]=eigs(covs(:,:,i),r*c);
    lams(:,i)=abs(diag(D));
    vecs(:,:,i)=reshape(V(:,1),r,c);
end

for i=1:10
    figure(i);
    plot(lams(:,i));
    xlabel('Index');
    ylabel('Eigenvalues');
    title(strcat('Digit : ',int2str(i-1)));
end

for i=1:10
    figure(i+10);
    subplot(1,3,1);
    imshow(rescale(means(:,:,i)-sqrt(lams(1,i))*vecs(:,:,i)));
    title('\mu - \surd\lambda_1v_1','FontSize',11);
    subplot(1,3,2);
    imshow(rescale(means(:,:,i)));
    title('\mu','FontSize',12);
    subplot(1,3,3);
    imshow(rescale(means(:,:,i)+sqrt(lams(1,i))*vecs(:,:,i)));
    title('\mu + \surd\lambda_1v_1','FontSize',11);
end
