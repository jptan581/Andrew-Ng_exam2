function plotdata(x,y)
m = 0;
z = zeros(length(y),2);
j = 1;
for i = 1:length(y)
    if(y(i) == 1)
        z(j,:) = x(i,:);
        m = m + 1;
        j = j + 1;
    end
end
plot(z(1:j-1,1),z(1:j-1,2),'r+','MarkerSize',10,'linewidth',2);
hold on

n = j-1;
for i = 1:length(y)
    if(y(i) == 0)
        z(j,:) = x(i,:);
        m = m + 1;
        j = j + 1;
    end
end
plot(z(n+1:length(y),1),z(n+1:length(y),2),'go','MarkerSize',10,'linewidth',2);
hold off

end