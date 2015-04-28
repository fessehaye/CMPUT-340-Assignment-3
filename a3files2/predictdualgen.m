function [yhat] = predictdualgen(a2,Xtest,X,kernelfun)
yhat = a2' * kernelfun(X,Xtest);
yhat = yhat';
