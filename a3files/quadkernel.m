function [K] = quadkernel(X1,X2)
	K = (X1*X2' + 1).^2;
