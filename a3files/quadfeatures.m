function [V] = quadfeatures(X)
	for i = 1:size(X,1)
		U = X(i,:)'*X(i,:);
		V(i,:) = [1 sqrt(2)*X(i,:) U(:)'];
	end
