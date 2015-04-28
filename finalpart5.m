featurefun = @(X)quadfeatures(X);
[w3] = fitgenreg(y,X,lambda,featurefun);
yhat = predictgen(w3,Xtest,featurefun)

kernelfun = @(X1,X2)quadkernel(X1,X2);
a2 = fitdualgenreg(y,X,lambda,kernelfun);
yhat2 = predictdualgen(a2,Xtest,X,kernelfun)