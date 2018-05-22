function out = mapFeature(X1, X2)
%X1,X2分别为X的初始特征，为118*1矩阵；
degree = 6;     %新的特征为X的6次方；
m =size(X1,1);
out = ones(m,1);
for i = 1:degree
    for j = 0:i
        out(:, end+1) = (X1.^(i-j)).*(X2.^j);
    end
end

end