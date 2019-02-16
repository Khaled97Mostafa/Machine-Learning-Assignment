function [ J, theta ] = Reg_ression(X, Y, power)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
alpha = 0.03;
theta = zeros(6, 1);
J = zeros(100, 1);

X= X.^power;
m = length(Y);

hypo = (X)*theta;

for i= 1:100
    hypo = (X)*theta;
    theta = theta - (alpha*(1/m)*sum((hypo-Y).*X)');
    J(i) = (1/(2*m))*sum(((X * theta) - Y).^2);
end

end