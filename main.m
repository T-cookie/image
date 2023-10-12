% 代码主函数
% 1.读入图片和标签数据
% 2.将数据归一化到0-1之间
[x_train,y_train,x_test,y_test]=getdata();

% 矩阵归一化
x_train = mapminmax(x_train,0,1);
x_test =mapminmax(x_test,0,1);

% 训练数据
[w1,b1,w_h1,b_h1]=mytrain(x_train,y_train);
open('error.fig');     
% 测试数据准确性
fprintf('mytrain正确率:\n');
mytest(x_test,y_test,w1,b1,w_h1,b_h1);

% 以下代码暂时注释，随后测试其正确性
% [w2,b2,w_h2,b_h2]=mytrain(x_train,y_train);
% fprintf('mytrain_mini正确率:\n');
% mytest(x_test,y_test,w2,b2,w_h2,b_h2);
