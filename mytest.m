function[]= mytest(x_test,y_test,w,b,w_h,b_h)
%x_test:������������������
%y_test�����������ı�ǩ
%w�������Ȩ��
%b�������ƫ��
%w_h�����ز�Ȩ��
%b_h�����ز�ƫ��

test = zeros(10,50);
for k=1:50
    x = x_test(:,k);

    hid = layerout(w_h,b_h,x);
    test(:,k)=layerout(w,b,hid);

    %��ȷ�ʱ�ʾ��ʽһ�������ȷ����
    [t,t_index]=max(test);
    
    [y,y_index]=max(y_test);

    sum = 0;
    for p=1:length(t_index)
        if t_index(p)==y_index(p)
            sum =sum+1;
        end
    end
end

fprintf('��ȷ��: %d/50\n',sum);

%��ȷ�ʱ�ʾ��ʽ������plotconfusion����
plotconfusion(y_test,test);
end