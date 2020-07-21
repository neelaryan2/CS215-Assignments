image1=imread('T1.jpg');
image2=imread('T2.jpg');
[r,c]=size(image1);
R1=zeros(1,21);
QMI1=zeros(1,21);
R2=zeros(1,21);
QMI2=zeros(1,21);
for tx=-10:10
    t1=double(image1);
    t2=double(image2);
    t3=double(255-image1);
    if tx>=0
        t2(:,tx+1:end)=t2(:,1:c-tx);
        t2(:,1:tx)=0;
        t3(:,tx+1:end)=t3(:,1:c-tx);
        t3(:,1:tx)=0;
    else
        t2(:,1:c+tx)=t2(:,1-tx:end);
        t2(:,c+1+tx:end)=0;
        t3(:,1:c+tx)=t3(:,1-tx:end);
        t3(:,c+1+tx:end)=0;
    end
    mean1=sum(sum(t1))/(r*c);
    mean2=sum(sum(t2))/(r*c);
    mean3=sum(sum(t3))/(r*c);
    var1=0;
    var2=0;
    var3=0;
    for i=1:r
        for j=1:c
            R1(tx+11)=R1(tx+11)+(t1(i,j)-mean1)*(t2(i,j)-mean2);
            R2(tx+11)=R2(tx+11)+(t1(i,j)-mean1)*(t3(i,j)-mean3);
            var1=var1+((t1(i,j)-mean1)^2);
            var2=var2+((t2(i,j)-mean2)^2);
            var3=var3+((t3(i,j)-mean3)^2);
        end
    end
    var1=(var1^0.5);
    var2=(var2^0.5);
    var3=(var3^0.5);  
    R1(tx+11)=R1(tx+11)/(var1*var2);
    R2(tx+11)=R2(tx+11)/(var1*var3);
    p1=zeros(26,1);
    p2=zeros(26,1);
    p12=zeros(26,26);
    p3=zeros(26,1);
    p13=zeros(26,26);
    for i=1:r
        for j=1:c
            I1=fix(t1(i,j)/10)+1;
            I2=fix(t2(i,j)/10)+1;
            I3=fix(t3(i,j)/10)+1;
            p1(I1)=p1(I1)+1;
            p2(I2)=p2(I2)+1;
            p12(I1,I2)=p12(I1,I2)+1;
            p3(I3)=p3(I3)+1;
            p13(I1,I3)=p13(I1,I3)+1;
        end
    end
    p1=p1/(sum(sum(p1)));
    p2=p2/(sum(sum(p2)));
    p12=p12/(sum(sum(p12)));
    p3=p3/(sum(sum(p3)));
    p13=p13/(sum(sum(p13)));
    for i=1:26
        for j=1:26
            temp=p12(i,j)-p1(i)*p2(j);
            temp=temp^2;
            QMI1(tx+11)=QMI1(tx+11)+temp;
            temp=p13(i,j)-p1(i)*p3(j);
            temp=temp^2;
            QMI2(tx+11)=QMI2(tx+11)+temp;
        end
    end
end
tx=-10:10;
figure,plot(tx,R1);
title('Correlation Coeff. vs tx');
xlabel('tx');
ylabel('Correlation Coeff.');
figure,plot(tx,QMI1);
title('QMI vs tx');
xlabel('tx');
ylabel('QMI');
figure,plot(tx,R2);
title('Correlation Coeff.(-ve image) vs tx');
xlabel('tx');
ylabel('Correlation Coeff.(-ve image)');
figure,plot(tx,QMI2);
title('QMI(-ve image) vs tx');
xlabel('tx');
ylabel('QMI(-ve image)');

