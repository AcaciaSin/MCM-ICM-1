function Zmain()
%nl:��������;nc:������Ŀ;fp:������ڴ��½��복���ĸ���;dt:���沽��ʱ��;nt:����ʱ��;tcinfo:������ʻ��ز���
[nl,nc,fp,dt,nt] = ZGetBasicInfo();
tcinfo=ZGetTrafficiInfo(); %����������ʡ�Ԫ������ٶȡ�����������ʡ��շ�վλ�á��Զ���ʻ��������
%����Ԫ���ռ�
cellspace=ZGenerateCellSpace(nl,nc,tcinfo);
%��ʼ����
ZTrafficSimulating(cellspace,fp,dt,nt,tcinfo);
end