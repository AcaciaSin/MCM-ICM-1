function cellspace=ZGenerateCellSpace(nl,nc,tcinfo)
%nl:��������;nc:������Ŀ;
%tcinfo:����������ʡ�Ԫ������ٶȡ�����������ʡ��շ�վλ�á��Զ���ʻ��������
hmax=nc+2*4;
for x=1:nl %����ͨ��x����������·����
    for i=1:hmax %����ÿһ����
        if (i>4)&&(i<9) %iֻ��ȡ5,6,7,8,��4����
            cellspace{i,x}=ZGenerateCell(3);
        else
            cellspace{i,x}=ZGenerateCell(1); %Ϊ1��ʾ����·(��ɫ����)
        end
    end
end
%���������Ԫ���ռ�����ֶ��޸�
for x=3:10 %����ͨ��x����������ķ���
    for y=(tcinfo(4)-16):(tcinfo(4)+16) %�շ�վ����ռ32��Ԫ��
        cell=cellspace{x,y};
        cell(1)=3; %�շ�վ���ֵ�������·
        cellspace{x,y}=cell;
    end
end
for x=1:hmax; %���շ�վ���ĵ�һ��Ϳ��
    cell=cellspace{x,tcinfo(4)};
    cell(1)=1;
    cellspace{x,tcinfo(4)}=cell;
end
cell=cellspace{x,tcinfo(4)};
cell(1)=1;
for y=9:16
cellspace{3,tcinfo(4)-y}=cell;cellspace{3,tcinfo(4)+y}=cell;
cellspace{10,tcinfo(4)-y}=cell;cellspace{10,tcinfo(4)+y}=cell;    
end
end