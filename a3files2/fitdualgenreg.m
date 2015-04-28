function [a2] = fitdualgenreg(y,X,lambda,kernelfun)
a2 = (kernelfun(X,X) + lambda*eye(size(kernelfun(X,X),2))) \ (y);