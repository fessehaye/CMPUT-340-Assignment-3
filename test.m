t = 10;
te = 1000;
repeats = 100;

%define parameters: u, sigma, lambda, featurefun
n = 2;
u = [0; ones(n-1,1)]; % target weights
sigma = 0.1; % noise level
lambda = 0.005; % regularization parameter
featurefun = @(X)quadfeatures(X);
%generate test data: Xtest and ytest
Xtest = [ones(te,1) rand(te, n-1)]; % training patterns

ytest = (Xtest*u).^2 + randn(te,1)*sigma; % target values
for r = 1:repeats

   %generate training data: X and y
    X = [ones(t,1) rand(t, n-1)]; % training patterns
    y = (X*u).^2 + randn(t,1)*sigma; % target values


   w1 = fitlin(y,X)
   w2 = fitlinreg(y,X,lambda)
   w3 = fitgenreg(y,X,lambda,featurefun)

   yhat_train1 = X*w1
   yhat_train2 = X*w2
   yhat_train3 = predictgen(w3,X,featurefun)

   err_train1(r) = (y - yhat_train1)'*(y - yhat_train1)/t
   err_train2(r) = (y - yhat_train2)'*(y - yhat_train2)/t
   err_train3(r) = (y - yhat_train3)'*(y - yhat_train3)/t

   yhat_test1 = Xtest*w1
   yhat_test2 = Xtest*w2
   yhat_test3 = predictgen(w3,Xtest,featurefun)

   err_test1(r) = (ytest - yhat_test1)'*(ytest - yhat_test1)/te;
   err_test2(r) = (ytest - yhat_test2)'*(ytest - yhat_test2)/te;
   err_test3(r) = (ytest - yhat_test3)'*(ytest - yhat_test3)/te;

end

average_train_error1 = mean(err_train1)
average_train_error2 = mean(err_train2)
average_train_error3 = mean(err_train3)
std_train_error1 = std(err_train1)/sqrt(repeats)
std_train_error2 = std(err_train2)/sqrt(repeats)
std_train_error3 = std(err_train3)/sqrt(repeats)

average_test_error1 = mean(err_test1)
average_test_error2 = mean(err_test2)
average_test_error3 = mean(err_test3)
std_test_error1 = std(err_test1)/sqrt(repeats)
std_test_error2 = std(err_test2)/sqrt(repeats)
std_test_error3 = std(err_test3)/sqrt(repeats)