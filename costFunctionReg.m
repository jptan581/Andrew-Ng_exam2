function [J, grad] = costFunctionReg(theta, X, y, lambda)
%theta�Ż�������Ϊ28*1����
%XΪ118*28����
%yΪ118*1����
%lambdaΪ���򻯲�����
[m,n] =size(X);
J = 0;
z = X * theta;        %zΪ118*1����
h = sigmoid(z);        %hΪ118*1����
J = -1/m*(y'*log(h) + (1-y)'*log(1-h)) + lambda/2/m*theta(2:end)'*theta(2:end);   %JΪ���ۺ���

grad = zeros(n,1);
grad = X'*(h-y)/m;
grad(2:end) = X(:,2:end)'*(h-y)/m + lambda/m*theta(2:end);

end
