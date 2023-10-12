function[w,b,w_h,b_h]=mytrain(x_train,y_train)
%train function:设置一个隐藏层，输入784-->隐藏层神经元个数-->输出10
%x_train:训练样本的像素数据
%y_train：训练样本的标签
%w：输出层权重
%b：输出层偏置
%w_h：隐藏层权重
%b_h：隐藏层偏置
%step：循环步数

% 网络参数配置
step = input('迭代步数：');
a = input('学习因子：');
in = 784;                            % 输入神经元个数
hid = input('隐藏层神经元个数：');    % 隐藏层神经元个数n
out = 10;                            % 输出层神经元个数
o =1;

w = randn(out,hid);             % 返回out*hid矩阵，即隐藏层到输出层的权值矩阵
b = randn(out,1);               % 返回out*1矩阵，即输出层神经元的偏值
w_h =randn(hid,in);             % 返回hid*in矩阵，即输入层到隐藏层的权值矩阵，每一行代表一样隐层单元的权值
b_h = randn(hid,1);             % 返回hid*1矩阵，即隐藏层神经元的偏值


for i=0:step
    % 每次均打乱训练样本
    r=randperm(1000);           % 1到4000这些数随机打乱得到的一个数字序列
    x_train = x_train(:,r);     % 按照r内的数字顺序将x_train的各列打乱
    y_train = y_train(:,r);     % 按照同样的顺序将y_train的各列打乱
    i
    % 每次读取一副图像，计算各层输出
    for j=1:1000
        x = x_train(:,j);       % 一次读取一列数据
        y = y_train(:,j);       % 读取图像标签

        hid_put = layerout(w_h,b_h,x);      % 计算隐层神经元的输出
        out_put = layerout(w,b,hid_put);    % 计算输出层神经元的输出

        %更新公式的实现，典型的反向传播算法更新各权值
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