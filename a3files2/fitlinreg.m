function [w2] = fitlinreg(y,X,lambda)
w2 =   (X' * X + (lambda*eye(size(X,2)))) \ (X' * y);