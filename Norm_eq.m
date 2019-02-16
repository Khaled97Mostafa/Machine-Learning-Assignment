function [ theta ] = Norm_eq( X, Y )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
 theta = (X'*X)^(-1) * (X'*Y);

end

