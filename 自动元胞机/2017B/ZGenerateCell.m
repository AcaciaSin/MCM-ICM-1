function cell=ZGenerateCell(num)
ex=importdata('cellinfo.txt');
%Ԫ�����ͣ��ٶȣ�������ʶ����������
cell=[num,ex.data,0,0];
end