% ����������
% 1.����ͼƬ�ͱ�ǩ����
% 2.�����ݹ�һ����0-1֮��
[x_train,y_train,x_test,y_test]=getdata();

% �����һ��
x_train = mapminmax(x_train,0,1);
x_test =mapminmax(x_test,0,1);

% ѵ������
[w1,b1,w_h1,b_h1]=mytrain(x_train,y_train);
open('error.fig');     
% ��������׼ȷ��
fprintf('mytrain��ȷ��:\n');
mytest(x_test,y_test,w1,b1,w_h1,b_h1);

% ���´�����ʱע�ͣ�����������ȷ��
% [w2,b2,w_h2,b_h2]=mytrain(x_train,y_train);
% fprintf('mytrain_mini��ȷ��:\n');
% mytest(x_test,y_test,w2,b2,w_h2,b_h2);
