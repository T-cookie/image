function[w,b,w_h,b_h]=mytrain_mini(x_train,y_train)
%train function:����һ�����ز㣬784-->���ز���Ԫ����-->10
%x_train:ѵ����������������
%y_train��ѵ�������ı�ǩ
%w�������Ȩ��
%b�������ƫ��
%w_h�����ز�Ȩ��
%b_h�����ز�ƫ��
%step��ѭ������

step=input('����������');
a=input('ѧϰ���ӣ�');
in = 784; %������Ԫ����
hid = input('���ز���Ԫ������');%���ز���Ԫ����
out = 10; %�������Ԫ����
o =1;

w = randn(out,hid);
b = randn(out,1);
w_h =randn(hid,in);
b_h = randn(hid,1);


for i=0:step
    %����ѵ������
    r=randperm(4000);
    x_train = x_train(:,r);
    y_train = y_train(:,r);
    %mini_batch
    for jj=0:399
        %ȡbatchΪ10  ����ȡ10�ε�ƽ��ֵ
        for j=jj*10+1:(jj+1)*10
            x = x_train(:,j);
            y = y_train(:,j);

            hid_put = layerout(w_h,b_h,x);
            out_put = layerout(w,b,hid_put);

            %���¹�ʽ��ʵ��
            o_update = (y-out_put).*out_put.*(1-out_put);
            h_update = ((w')*o_update).*hid_put.*(1-hid_put);

            if j==1
                outw_update = (double(a)/10)*(o_update*(hid_put'));
                outb_update = (double(a)/10)*o_update;
                hidw_update = (double(a)/10)*(h_update*(x'));
                hidb_update = (double(a)/10)*h_update;
            end

            if j~=1
                outw_update = outw_update + (double(a)/10)*(o_update*(hid_put'));
                outb_update = outb_update -(double(a)/10)*o_update;
                hidw_update = hidw_update + (double(a)/10)*(h_update*(x'));
                hidb_update = hidb_update -(double(a)/10)*h_update;
            end
        end

        w = w + outw_update;
        b = b+ outb_update;
        w_h = w_h +hidw_update;
        b_h =b_h +hidb_update;
    end  
end
end