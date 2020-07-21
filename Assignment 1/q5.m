clear; clc;
x = [-3:0.02:3];
y = 5*sin(2.2*x + pi/3);
f1 = figure;
plot(x,y)
hold on
title('f=30%')
xlabel('x');
ylabel('y');
ind = randperm(301, 90);
z=y;
randoms = rand(1,301);
z(ind) = z(ind) + (100 + 20*randoms(ind));
plot(x,z)
hold on
ymedian = [];
for i=1:301
    ymedian = [ymedian median(z(max(1,i-8):min(301,i+8)))];
end
plot(x,ymedian)
hold on
ymean = [];
for i=1:301
    ymean = [ymean mean(z(max(1,i-8):min(301,i+8)))];
end
plot(x,ymean)
hold on
yquartile = [];
for i=1:301
    yquartile = [yquartile quantile(z(max(1,i-8):min(301,i+8)), 0.25)];
end
plot(x, yquartile)
legend('y','z','y_m_e_d_i_a_n','y_m_e_a_n','y_q_u_a_r_t_i_l_e')
hold off
err_mean = mean( (y-ymean) .^2 ) / mean( y.^2 );
err_median = mean( (y-ymedian) .^2 ) / mean( y.^2 );
err_quart = mean( (y-yquartile) .^2 ) / mean( y.^2 );
fprintf('Relative mean squared errors(f=0.30) with:\nMedian = %s\nMean = %s\nQuartile = %s\n',err_median,err_mean,err_quart);
f2=figure;
plot(x,y)
hold on
title('f=60%')
xlabel('x');
ylabel('y');
ind = randperm(301, 180);
z=y;
randoms = rand(1,301);
z(ind) = z(ind) + (100 + 20*randoms(ind));
plot(x,z)
hold on
ymedian = [];
for i=1:301
    ymedian = [ymedian median(z(max(1,i-8):min(301,i+8)))];
end
plot(x,ymedian)
hold on
ymean = [];
for i=1:301
    ymean = [ymean mean(z(max(1,i-8):min(301,i+8)))];
end
plot(x,ymean)
hold on
yquartile = [];
for i=1:301
    yquartile = [yquartile quantile(z(max(1,i-8):min(301,i+8)), 0.25)];
end
plot(x, yquartile)
legend('y','z','y_m_e_d_i_a_n','y_m_e_a_n','y_q_u_a_r_t_i_l_e')
hold off
err_mean = mean( (y-ymean) .^2 ) / mean( y.^2 );
err_median = mean( (y-ymedian) .^2 ) / mean( y.^2 );
err_quart = mean( (y-yquartile) .^2 ) / mean( y.^2 );
fprintf('Relative mean squared errors(f=0.60) with:\nMedian = %s\nMean = %s\nQuartile = %s\n',err_median,err_mean,err_quart);
