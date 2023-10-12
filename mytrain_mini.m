function[w,b,w_h,b_h]=mytrain_mini(x_train,y_train)
%train function:设置一个隐藏层，784-->隐藏层神经元个数-->10
%x_train:训练样本的像素数据
%y_train：训练样本的标签
%w：输出层权重
%b：输出层偏置
%w_h：隐藏层权重
%b_h：隐藏层偏置
%step：循环步数

step=input('迭代步数：');
a=input('学习因子：');
in = 784; %输入神经元个数
hid = input('隐藏层神经元个数：');%隐藏层神经元个数
out = 10; %输出层神经元个数
o =1;

w = randn(out,hid);
b = randn(out,1);
w_h =randn(hid,in);
b_h = randn(hid,1);


for i=0:step
    %打乱训练样本
    r=randperm(4000);
    x_train = x_train(:,r);
    y_train = y_train(:,r);
    %mini_batch
    for jj=0:399
        %取batch为10  更新取10次的平均值
        for j=jj*10+1:(jj+1)*10
            x = x_train(:,j);
            y = y_train(:,j);

            hid_put = layerout(w_h,b_h,x);
            out_put = layerout(w,b,hid_put);

            %更新公式的实现
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