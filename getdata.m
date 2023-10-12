function[x_train,y_train,x_test,y_test]=getdata()
% 把图片变成像素矩阵
% path :图片路径 
% x_train:训练样本像素矩阵(784,4000)
% y_train:训练样本标签(10,4000)
% x_test:测试样本像素矩阵(784,50)
% y_test:测试样本标签(10,50)

x_train = [];
for i=0:9
    for j=1:100
        x=im2double(imread(strcat('.\images1000\',num2str(i),'_', num2str(j,'%03d'),'.bmp')));
        %size(x)
        x=reshape(x,784,1);         % 将28*28的数值矩阵变为784*1,每列代表一幅图
        x_train = [x_train,x];      % 每循环一次加入一列数据
    end
end

x_test =[];
for i=1:10
    for j=1:5
        x=im2double(imread(strcat('.\test\','img00',num2str(i),'-0000', num2str(j),'.bmp')));
        x=reshape(x,784,1); 
        if i==1&&j==1
            
        end        % 将28*28的数值矩阵变为784*1,每列代表一幅图
        x_test = [x_test,x];        % 每循环一次加入一列数据
    end
end
x_test(:,1)
% 读取标签文件，注意：由于标签的存储问题，读入后需要进行转置
data=csvread('label.csv');
data2=csvread('label2.csv');
y_train=data';
y_test = data2';

% 返回的参数
x_train;
y_train;
x_test;
y_test;
save mat x_train
end
