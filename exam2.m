%导入数据并赋值
data = load('ex2data1.txt');
x = data(:,1:2);
y = data(:,3);
%画图
plotdata(x,y);
hold on; 
xlabel('Exam1 score');
ylabel('Exam2 score');
legend('Admitted','Not-Admitted');
hold off;

% 计算代价函数和梯度下降
%m = length(y);
[m,n] = size(x);
x = [ones(m,1),x];
theta = zeros(n+1,1);
[jval,gradient] = costfunction(x,y,theta);
fprintf('jval at initial theta (zeros): %f\n', jval); %\n为换行符
fprintf('Expected jval (approx): 0.693\n');
fprintf('grandient at initial theta (zeros): \n');
fprintf(' %f \n', gradient);
fprintf('Expected jval (approx):\n -0.1\n 12.00\n -11.26\n ');

%采用fimunic求逻辑回归代价函数的最小值
options = optimset('Gradobj','on','MaxIter',1000);
[opttheta, functionval,exitflag] = fminunc(@(t)(costfunction(x,y,t)),theta,options);

fprintf('jval at fminuc: %f\n', functionval); %\n为换行符
fprintf('Expected jval (approx): 0.203\n');
fprintf('theta: \n');
fprintf(' %f \n', opttheta);
fprintf('Expected theta (approx):\n');
fprintf(' -25.161\n 0.206\n 0.201\n');
%根据fimunic求出来的theta值画出决策边界
plotDecisionBoundary(opttheta,x,y);
hold on;
xlabel('Exam 1 score');
ylabel('Exam 2 score');
legend('Admitted', 'Not admitted');
hold off;
%根据测试项进行验证
prob = sigmoid([1 45 85] * opttheta);
fprintf(['For a student with scores 45 and 85, we predict an admission ' ...
         'probability of %f\n'], prob);
fprintf('Expected value: 0.775 +/- 0.002\n\n');
p = predict(opttheta, x);
fprintf('Train Accuracy: %f\n', mean(double(p == y)) * 100);
fprintf('Expected accuracy (approx): 89.0\n');
