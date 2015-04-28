function [w3] = fitgenreg(y,X,lambda,featurefun)
X2 = featurefun(X);
w3=( X2'* X2 + lambda*eye(size(X2,2)) ) \ (X2' * y);