function[x_train,y_train,x_test,y_test]=getdata()
% ��ͼƬ������ؾ���
% path :ͼƬ·�� 
% x_train:ѵ���������ؾ���(784,4000)
% y_train:ѵ��������ǩ(10,4000)
% x_test:�����������ؾ���(784,50)
% y_test:����������ǩ(10,50)

x_train = [];
for i=0:9
    for j=1:100
        x=im2double(imread(strcat('.\images1000\',num2str(i),'_', num2str(j,'%03d'),'.bmp')));
        %size(x)
        x=reshape(x,784,1);         % ��28*28����ֵ�����Ϊ784*1,ÿ�д���һ��ͼ
        x_train = [x_train,x];      % ÿѭ��һ�μ���һ������
    end
end

x_test =[];
for i=1:10
    for j=1:5
        x=im2double(imread(strcat('.\test\','img00',num2str(i),'-0000', num2str(j),'.bmp')));
        x=reshape(x,784,1); 
        if i==1&&j==1
            
        end        % ��28*28����ֵ�����Ϊ784*1,ÿ�д���һ��ͼ
        x_test = [x_test,x];        % ÿѭ��һ�μ���һ������
    end
end
x_test(:,1)
% ��ȡ��ǩ�ļ���ע�⣺���ڱ�ǩ�Ĵ洢���⣬�������Ҫ����ת��
data=csvread('label.csv');
data2=csvread('label2.csv');
y_train=data';
y_test = data2';

% ���صĲ���
x_train;
y_train;
x_test;
y_test;
save mat x_train
end
