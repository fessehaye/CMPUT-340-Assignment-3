function [yhat] = predictgen(w3,Xtest,featurefun)
yhat = featurefun(Xtest)*w3;