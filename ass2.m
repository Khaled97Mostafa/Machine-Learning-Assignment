clc;
clear all;

data = tabularTextDatastore('heart_DD.csv','TreatAsMissing','NA',.....
    'MissingValue',0,'ReadSize',25000);
T = read(data);
[row,col]=size(T);

f1 = T{:, 4};
f2 = T{:, 5};
f3 = T{:, 7};
f4 = T{:, 11};
f5 = T{:, 12};
Y = T{:, 14};

m = length(Y);

%Normalization
f1=f1/max(f1);
f2=f2/max(f2);
f3=f3/max(f3);
f4=f4/max(f4);
f5=f5/max(f5);
Y_norm=Y/max(Y);

X = [ones(m, 1) f1 f2 f3 f4 f5];

[J1, theta] = RegressionLogistic(X, Y_norm, 1);
[J2, theta] = RegressionLogistic(X, Y_norm, 2);
[J3, theta] = RegressionLogistic(X, Y_norm, 3);
[J4, theta] = RegressionLogistic(X, Y_norm, 4);

%figure(1)
plot(J1);
%figure(2)
hold on
plot(J2);
%figure(3)
hold on
plot(J3);
%figure(4)
hold on
plot(J4);