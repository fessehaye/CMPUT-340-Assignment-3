function [yhat] = predictduallin(a1,Xtest,X)
yhat = a1' * X * Xtest';
yhat = yhat';
