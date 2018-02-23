clc;
clear all;
% �����������泵���ܶ�(��0��1)�仯�Ĺ���
T=3030;
P=0.3; % ��������ĸ���
v_max=6; % vn��0,1,...6��ȡֵ
L=2000; % ������,��·�ܳ�Ϊ2000������(�Ǹ���,ͷβ���),��N����
dens=0.002; %������ʼ�����ܶ� 
p=1; %ͳ�������ܶ����� 
while dens<=1 
    N=fix(dens*L); %������Ŀ,Nһ��С��L
    m=1;
    % ����N�����ĳ�ʼ����ٶ�
    v_matrix=randperm(N); % randperm����1,2,...,N�Ĵ����˵�����
    for i=1:N
        v_matrix(i)=mod(v_matrix(i),v_max+1); % ���ٶ�Ͷ�䵽����Χ
    end
    % ������ʼ���λ��,N�������뵥������(L������)
    [a,b]=find(randperm(L)<=N);
    loc_matrix=b; % λ�ô�С��������,��5����ʱ,434,509,1513,1917
    %�仯���� 
    for i=1:T
        %���峵ͷ���,��������������ڸ�����,��ͷ�����Ϊ��0
        if loc_matrix(N)>loc_matrix(1) 
            % (��1��2000Ϊ��),����1917���ӵĳ�-->2000-->1-->434���ӳ�ͷ�ľ���
            % �����N��һ��ʼ�ı��,֮��N��Ӧ��λ�ò���һ����1-2000������
            headways(N)=L-loc_matrix(N)+loc_matrix(1)-1;
        else
            headways(N)=loc_matrix(1)-loc_matrix(N)-1;
        end
        for j=N-1:-1:1
            if loc_matrix(j+1)>loc_matrix(j)
                headways(j)=loc_matrix(j+1)-loc_matrix(j)-1;
            else
                headways(j)=L+loc_matrix(j+1)-loc_matrix(j)-1;
            end
        end
        
        %�ٶȱ仯 
        v_matrixNS1=min([v_max-1,v_matrix(1),max(0,headways(1)-1)]);
        %����������� %����ٶ� %���������
        v_matrix(N)=min([v_max,v_matrix(N)+1,headways(N)+v_matrixNS1]); %NS�����µ�N�������ٶȹ���ֵ
        for j=N-1:-1:1 
            v_matrixNS=min([v_max-1,v_matrix(j+1),max(0,headways(j+1)-1)]); %NS������ǰһ�������ٶȹ���ֵ
            v_matrix(j)=min([v_max,v_matrix(j)+1,headways(j)+v_matrixNS]); %NS�����µ�j������ǰһ�������ٶȹ���ֵ
        end
        
        %�Ը���P�������
        if rand()<P;
            v_matrix=max(v_matrix-1,0); %������������µ��ٶȱ仯
        end
        %λ�ø���
        for j=N:-1:1
            loc_matrix(j)=loc_matrix(j)+v_matrix(j);
            if loc_matrix(j)>=L
                loc_matrix(j)=loc_matrix(j)-L; %NS�����µ�j������λ�ø���
            end
        end
        
        %�ɼ�������ͼ
        if i>L+1000 %����ÿ��ĺ�30������ȡƽ��
            speed(m)=sum(v_matrix)/N; %��ȡƽ���ٶ�
            m=m+1;
        end
    end
    flow(p)=(sum(speed)/30)*dens; %��ͬ�ܶ��µ��������� 
    density(p)=dens;
    dens=dens+0.01;
    p=p+1;
end
plot(density,flow)