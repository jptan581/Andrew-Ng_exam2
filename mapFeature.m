function out = mapFeature(X1, X2)
%X1,X2�ֱ�ΪX�ĳ�ʼ������Ϊ118*1����
degree = 6;     %�µ�����ΪX��6�η���
m =size(X1,1);
out = ones(m,1);
for i = 1:degree
    for j = 0:i
        out(:, end+1) = (X1.^(i-j)).*(X2.^j);
    end
end

end