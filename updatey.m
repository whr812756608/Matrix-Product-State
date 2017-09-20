function [T2,T1,ly]=updatey(T2,T1,ly,lx2,lz2,lx1,lz1,D,Gy)
%%
T1=contracttensors(T1,4,2,lx1,2,1);
T1=contracttensors(T1,4,2,sqrt(ly),2,1);
T1=contracttensors(T1,4,2,lz1,2,1);

T2=contracttensors(T2,4,2,lx2,2,1);
T2=contracttensors(T2,4,2,sqrt(ly),2,1);
T2=contracttensors(T2,4,2,lz2,2,1);
%%
T=contracttensors(T2,4,3,T1,4,3);
T=contracttensors(Gy,4,[3,4],T,6,[1,4]);
T=permute(T,[1,3,4,2,5,6]);
T=normalize(T);
[T2,ly,T1]=psvd(T,D);
T2=permute(T2,[1,2,4,3]);
T1=permute(T1,[2,3,1,4]);
%%
T1=contracttensors(T1,4,2,inv1(lx1),2,1);
T1=contracttensors(T1,4,3,inv1(lz1),2,1);
T1=permute(T1,[1,3,2,4]);
T1=normalize(T1);
T2=contracttensors(T2,4,2,inv1(lx2),2,1);
T2=contracttensors(T2,4,3,inv1(lz2),2,1);
T2=permute(T2,[1,3,2,4]);
T2=normalize(T2);
end