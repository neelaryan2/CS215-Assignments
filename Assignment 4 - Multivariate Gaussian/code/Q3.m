load('../data/points2D_Set1.mat');
myPCA(x,y,1);
load('../data/points2D_Set2.mat');
myPCA(x,y,2);

function myPCA(xp,yp,fig)
    [n,~]=size(xp);
    meanX=sum(xp)/n;
    meanY=sum(yp)/n;  
    A=zeros(n,2);
    A(:,1)=xp-meanX;
    A(:,2)=yp-meanY;
    covs=(transpose(A)*A)/n;
    [V,~]=eigs(covs,1);
    ref=linspace(min(xp),max(xp),125);
    figure(fig);
    scatter(xp,yp);
    xlabel('x');
    ylabel('y');
    title(strcat('Dataset : ',int2str(fig)));
    hold on
    Yval=(ref-meanX)*(V(2)/V(1)) + meanY;
    plot(ref,Yval,'LineWidth',2.0);
    hold off
end
