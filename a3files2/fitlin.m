function [w1] = fitlin(y,X)
w1 = (X' * X) \ (X' * y);