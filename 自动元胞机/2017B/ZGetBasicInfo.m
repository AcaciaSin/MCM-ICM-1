function [nl,nc,fp,dt,nt]=ZGetBasicInfo()
ex=importdata('basicinfo.txt');
ex=ex.data;
nl=ex(1); %��������
nc=ex(2); %������Ŀ
fp=ex(3); %������ڴ��½��복���ĸ���
dt=ex(4); %���沽��ʱ��
nt=ex(5); %����ʱ��
end