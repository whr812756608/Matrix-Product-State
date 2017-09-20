function [K,T]=absorb(T,lx,ly,lz,D)
%% ���յ�Ȩ�أ�
T{1}=contracttensors(T{1},4,2,sqrt(lx{1}),2,1);
T{1}=contracttensors(T{1},4,2,sqrt(ly{1}),2,1);
T{1}=contracttensors(T{1},4,2,sqrt(lz{1}),2,1);

T{2}=contracttensors(T{2},4,2,sqrt(lx{1}),2,1);
T{2}=contracttensors(T{2},4,2,sqrt(ly{3}),2,1);
T{2}=contracttensors(T{2},4,2,sqrt(lz{2}),2,1);

T{3}=contracttensors(T{3},4,2,sqrt(lx{2}),2,1);
T{3}=contracttensors(T{3},4,2,sqrt(ly{2}),2,1);
T{3}=contracttensors(T{3},4,2,sqrt(lz{2}),2,1);

T{4}=contracttensors(T{4},4,2,sqrt(lx{3}),2,1);
T{4}=contracttensors(T{4},4,2,sqrt(ly{2}),2,1);
T{4}=contracttensors(T{4},4,2,sqrt(lz{1}),2,1);

T{5}=contracttensors(T{5},4,2,sqrt(lx{3}),2,1);
T{5}=contracttensors(T{5},4,2,sqrt(ly{3}),2,1);
T{5}=contracttensors(T{5},4,2,sqrt(lz{3}),2,1);

T{6}=contracttensors(T{6},4,2,sqrt(lx{2}),2,1);
T{6}=contracttensors(T{6},4,2,sqrt(ly{1}),2,1);
T{6}=contracttensors(T{6},4,2,sqrt(lz{3}),2,1);
%% ���յ�����ָ�꣬����KA KB��ָ��˳�����Ϊxxyyzz
T1=cell(1,6);
K=cell(1,6);
for i=1:6
    T1{i}=permute(conj(T{i}),4:-1:1);
    K{i}=contracttensors(T1{i},4,4,T{i},4,1);
    K{i}=permute(K{i},[3,4,2,5,1,6]);
    K{i}=reshape(K{i},[D*D,D*D,D*D]);
    K{i}=normalize(K{i});
end
end