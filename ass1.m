data = tabularTextDatastore('house_prices_data_training_data.csv','TreatAsMissing','NA',.....
    'MissingValue',0,'ReadSize',25000);
T = read(data);
f1 = T{:, 4};
f2 = T{:, 5};
f3 = T{:, 8};
f4 = T{:, 11};
f5 = T{:, 12};
Y = T{:, 3};

m = length(Y);

%Normalization
f1=f1/max(f1);
f2=f2/max(f2);
f3=f3/max(f3);
f4=f4/max(f4);
f5=f5/max(f5);
Y_norm=Y/max(Y);

X = [ones(m, 1) f1 f2 f3 f4 f5];

%gradient descent
alpha = 0.03;
theta = zeros(6, 1);
J = zeros(100, 1);

hypo = (X)*theta;

for i= 1:100
    hypo = (X)*theta;
    theta = theta - (alpha*(1/m)*sum((hypo-Y_norm).*X)');
    J(i) = (1/(2*m))*sum(((X * theta) - Y_norm).^2);
end
plot(J);