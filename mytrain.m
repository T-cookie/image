function[w,b,w_h,b_h]=mytrain(x_train,y_train)
%train function:����һ�����ز㣬����784-->���ز���Ԫ����-->���10
%x_train:ѵ����������������
%y_train��ѵ�������ı�ǩ
%w�������Ȩ��
%b�������ƫ��
%w_h�����ز�Ȩ��
%b_h�����ز�ƫ��
%step��ѭ������

% �����������
step = input('����������');
a = input('ѧϰ���ӣ�');
in = 784;                            % ������Ԫ����
hid = input('���ز���Ԫ������');    % ���ز���Ԫ����n
out = 10;                            % �������Ԫ����
o =1;

w = randn(out,hid);             % ����out*hid���󣬼����ز㵽������Ȩֵ����
b = randn(out,1);               % ����out*1���󣬼��������Ԫ��ƫֵ
w_h =randn(hid,in);             % ����hid*in���󣬼�����㵽���ز��Ȩֵ����ÿһ�д���һ�����㵥Ԫ��Ȩֵ
b_h = randn(hid,1);             % ����hid*1���󣬼����ز���Ԫ��ƫֵ


for i=0:step
    % ÿ�ξ�����ѵ������
    r=randperm(1000);           % 1��4000��Щ��������ҵõ���һ����������
    x_train = x_train(:,r);     % ����r�ڵ�����˳��x_train�ĸ��д���
    y_train = y_train(:,r);     % ����ͬ����˳��y_train�ĸ��д���
    i
    % ÿ�ζ�ȡһ��ͼ�񣬼���������
    for j=1:1000
        x = x_train(:,j);       % һ�ζ�ȡһ������
        y = y_train(:,j);       % ��ȡͼ���ǩ

        hid_put = layerout(w_h,b_h,x);      % ����������Ԫ�����
        out_put = layerout(w,b,hid_put);    % �����������Ԫ�����

        %���¹�ʽ��ʵ�֣����͵ķ��򴫲��㷨���¸�Ȩֵ
        o_update = (y-out_put).*out_put.*(1-out_put);
        h_update = ((w')*o_update).*hid_put.*(1-hid_put);

        outw_update = a*(o_update*(hid_put'));
        outb_update = a*o_update;
        hidw_update = a*(h_update*(x'));
        hidb_update = a*h_update;

        w = w + outw_update;
        b = b+ outb_update;
        w_h = w_h +hidw_update;
        b_h =b_h +hidb_update;
    end
end  
end