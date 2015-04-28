function [a1] = fitduallinreg(y,X,lambda)
a1 = (X * X' + lambda*eye(size(X,1))) \ (y);
