function [J, grad] = costFunctionReg(theta, X, y, lambda)
%theta优化参数，为28*1矩阵
%X为118*28矩阵；
%y为118*1矩阵；
%lambda为正则化参数；
[m,n] =size(X);
J = 0;
z = X * theta;        %z为118*1矩阵；
h = sigmoid(z);        %h为118*1矩阵；
J = -1/m*(y'*log(h) + (1-y)'*log(1-h)) + lambda/2/m*theta(2:end)'*theta(2:end);   %J为代价函数

grad = zeros(n,1);
grad = X'*(h-y)/m;
grad(2:end) = X(:,2:end)'*(h-y)/m + lambda/m*theta(2:end);

end
