function [T1,T2,lx]=updatex(T1,T2,lx,ly1,lz1,ly2,lz2,D,Gx)
%%
% T1 ���յ�Ȩ�أ�x��Ȩ��ֻ����һ�룻
T1=contracttensors(T1,4,2,sqrt(lx),2,1);
T1=contracttensors(T1,4,2,ly1,2,1);
T1=contracttensors(T1,4,2,lz1,2,1);
% T2 ���յ�Ȩ�أ�x��Ȩ��ֻ����һ�룻
T2=contracttensors(T2,4,2,sqrt(lx),2,1);
T2=contracttensors(T2,4,2,ly2,2,1);
T2=contracttensors(T2,4,2,lz2,2,1);
%%
% T1��T2contract x bond
T=contracttensors(T1,4,2,T2,4,2);
T=contracttensors(Gx,4,[3,4],T,6,[1,4]);
T=permute(T,[1,3,4,2,5,6]);
T=normalize(T);
% svd�����ҵ���˳��
[T1,lx,T2]=psvd(T,D);
T1=permute(T1,[1,4,2,3]);
T2=permute(T2,[2,1,3,4]);
%%
% �ѻ�����Ȩ�س˻�ȥ��
T1=contracttensors(T1,4,3,inv1(ly1),2,1);
T1=contracttensors(T1,4,3,inv1(lz1),2,1);
T1=normalize(T1);
T2=contracttensors(T2,4,3,inv1(ly2),2,1);
T2=contracttensors(T2,4,3,inv1(lz2),2,1);
T2=normalize(T2);
end