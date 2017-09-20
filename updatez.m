function [T1,T2,lz]=updatez(T1,T2,lz,lx1,ly1,lx2,ly2,D,Gz)
%%
T1=contracttensors(T1,4,2,lx1,2,1);
T1=contracttensors(T1,4,2,ly1,2,1);
T1=contracttensors(T1,4,2,sqrt(lz),2,1);

T2=contracttensors(T2,4,2,lx2,2,1);
T2=contracttensors(T2,4,2,ly2,2,1);
T2=contracttensors(T2,4,2,sqrt(lz),2,1);
%%
T=contracttensors(T1,4,4,T2,4,4);
T=contracttensors(Gz,4,[3,4],T,6,[1,4]);
T=permute(T,[1,3,4,2,5,6]);
T=normalize(T);
[T1,lz,T2]=psvd(T,D);
T2=permute(T2,[2,3,4,1]);
%%
T1=contracttensors(T1,4,2,inv1(lx1),2,1);
T1=contracttensors(T1,4,2,inv1(ly1),2,1);
T1=permute(T1,[1,3,4,2]);
T1=normalize(T1);
T2=contracttensors(T2,4,2,inv1(lx2),2,1);
T2=contracttensors(T2,4,2,inv1(ly2),2,1);
T2=permute(T2,[1,3,4,2]);
T2=normalize(T2);
end