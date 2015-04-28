%load data1.mat;
featurefun = @(X)quadfeatures(X);
kernelfun1 = @(X1,X2)quadkernel(X1,X2);
kernelfun2 = @(X1,X2)gausskernel(X1,X2,50);

ww1 = fitlin(y,X);
ww2 = fitlinreg(y,X,25);
ww3 = fitgenreg(y,X,1e5,featurefun);
aa1 = fitdualgenreg(y,X,1e5,kernelfun1);
aa2 = fitdualgenreg(y,X,5e-3,kernelfun2);

   yhat_train1 = X*ww1;
   yhat_train2 = X*ww2;
   yhat_train3 = predictgen(ww3,X,featurefun);
   yhat_train4 = predictdualgen(aa1,X,X,kernelfun1);
   yhat_train5 = predictdualgen(aa2,X,X,kernelfun2);

   err_train1 = (y - yhat_train1)'*(y - yhat_train1)/67
   err_train2 = (y - yhat_train2)'*(y - yhat_train2)/67
   err_train3 = (y - yhat_train3)'*(y - yhat_train3)/67
   err_train4 = (y - yhat_train4)'*(y - yhat_train4)/67
   err_train5 = (y - yhat_train5)'*(y - yhat_train5)/67

   yhat_test1 = Xtest*ww1;
   yhat_test2 = Xtest*ww2;
   yhat_test3 = predictgen(ww3,Xtest,featurefun);
   yhat_test4 = predictdualgen(aa1,Xtest,X,kernelfun1);
   yhat_test5 = predictdualgen(aa2,Xtest,X,kernelfun2);

   err_test1 = (ytest - yhat_test1)'*(ytest - yhat_test1)/30
   err_test2 = (ytest - yhat_test2)'*(ytest - yhat_test2)/30
   err_test3 = (ytest - yhat_test3)'*(ytest - yhat_test3)/30
   err_test4 = (ytest - yhat_test4)'*(ytest - yhat_test4)/30
   err_test5 = (ytest - yhat_test5)'*(ytest - yhat_test5)/30