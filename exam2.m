%�������ݲ���ֵ
data = load('ex2data1.txt');
x = data(:,1:2);
y = data(:,3);
%��ͼ
plotdata(x,y);
hold on; 
xlabel('Exam1 score');
ylabel('Exam2 score');
legend('Admitted','Not-Admitted');
hold off;

% ������ۺ������ݶ��½�
%m = length(y);
[m,n] = size(x);
x = [ones(m,1),x];
theta = zeros(n+1,1);
[jval,gradient] = costfunction(x,y,theta);
fprintf('jval at initial theta (zeros): %f\n', jval); %\nΪ���з�
fprintf('Expected jval (approx): 0.693\n');
fprintf('grandient at initial theta (zeros): \n');
fprintf(' %f \n', gradient);
fprintf('Expected jval (approx):\n -0.1\n 12.00\n -11.26\n ');

%����fimunic���߼��ع���ۺ�������Сֵ
options = optimset('Gradobj','on','MaxIter',1000);
[opttheta, functionval,exitflag] = fminunc(@(t)(costfunction(x,y,t)),theta,options);

fprintf('jval at fminuc: %f\n', functionval); %\nΪ���з�
fprintf('Expected jval (approx): 0.203\n');
fprintf('theta: \n');
fprintf(' %f \n', opttheta);
fprintf('Expected theta (approx):\n');
fprintf(' -25.161\n 0.206\n 0.201\n');
%����fimunic�������thetaֵ�������߽߱�
plotDecisionBoundary(opttheta,x,y);
hold on;
xlabel('Exam 1 score');
ylabel('Exam 2 score');
legend('Admitted', 'Not admitted');
hold off;
%���ݲ����������֤
prob = sigmoid([1 45 85] * opttheta);
fprintf(['For a student with scores 45 and 85, we predict an admission ' ...
         'probability of %f\n'], prob);
fprintf('Expected value: 0.775 +/- 0.002\n\n');
p = predict(opttheta, x);
fprintf('Train Accuracy: %f\n', mean(double(p == y)) * 100);
fprintf('Expected accuracy (approx): 89.0\n');
