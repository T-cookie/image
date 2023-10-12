function[]= mytest(x_test,y_test,w,b,w_h,b_h)
%x_test:测试样本的像素数据
%y_test：测试样本的标签
%w：输出层权重
%b：输出层偏置
%w_h：隐藏层权重
%b_h：隐藏层偏置

test = zeros(10,50);
for k=1:50
    x = x_test(:,k);

    hid = layerout(w_h,b_h,x);
    test(:,k)=layerout(w,b,hid);

    %正确率表示方式一：输出正确个数
    [t,t_index]=max(test);
    
    [y,y_index]=max(y_test);

    sum = 0;
    for p=1:length(t_index)
        if t_index(p)==y_index(p)
            sum =sum+1;
        end
    end
end

fprintf('正确率: %d/50\n',sum);

%正确率表示方式二：用plotconfusion函数
plotconfusion(y_test,test);
end