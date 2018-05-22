function [jval, gradient] = testcostfunction(x,y,theta)

m = length(y);
jval = 0;
jval = -1/m*(y'*log(sigmoid(x*theta))+(1-y)'*log(1-sigmoid(x*theta)));
gradient = 1/m*x'*(sigmoid(x*theta)-y);
end