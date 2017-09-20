function [Upz,Dnz,Lz,Rz]=environmentz(K,D1,D)
K1=contracttensors(K{4},3,3,K{1},3,3);
K1=permute(K1,[2,1,3,4]);
K1=normalize(K1);
K2=contracttensors(K{2},3,3,K{3},3,3);
K2=permute(K2,[2,1,3,4]);
K2=normalize(K2);
K3=contracttensors(K{6},3,3,K{5},3,3);
K3=permute(K3,[2,1,3,4]);
K3=normalize(K3);
%%
Up=environmentUP(K1,K2,K3,D1,D);
Dn=environmentDN(K1,K2,K3,D1,D);
%%
Upz=cell(1,3);Dnz=cell(1,3);
Lz=cell(1,3);Rz=cell(1,3);
for i=1:3
    Upz{i}=contracttensors(Up{2*i-1},3,2,Up{2*i},3,1);
    Upz{i}=normalize(Upz{i});
    Dnz{i}=contracttensors(Dn{2*i-1},3,2,Dn{2*i},3,1);
    Dnz{i}=normalize(Dnz{i});
end

KK1=contracttensors(Upz{1},4,[2,4],K1,4,[1,2]);
KK1=contracttensors(KK1,4,[3,4],Dnz{1},4,[2,4]);
KK2=contracttensors(Upz{2},4,[2,4],K2,4,[1,2]);
KK2=contracttensors(KK2,4,[3,4],Dnz{2},4,[2,4]);
KK3=contracttensors(Upz{3},4,[2,4],K3,4,[1,2]);
KK3=contracttensors(KK3,4,[3,4],Dnz{3},4,[2,4]);

KK=contracttensors(KK1,4,[2,4],KK2,4,[1,3]);
KK=contracttensors(KK,4,[3,4],KK3,4,[1,3]);
ini=eye(D1)/sqrt(D1);
L=ini;R=ini;
for phi=1:25
    Lt=contracttensors(L,2,[1,2],KK,4,[1,2]);  Lt=normalize(Lt);
    Rt=contracttensors(KK,4,[3,4],R,2,[1,2]);  Rt=normalize(Rt);
    if (tensorerror(Lt,L)<1e-10)&&(tensorerror(Rt,R)<1e-10),break;end
    L=Lt;                               R=Rt;
end

Lz{1}=L;
Lz{2}=contracttensors(Lz{1},2,[1,2],KK1,4,[1,3]);Lz{2}=normalize(Lz{2});
Lz{3}=contracttensors(Lz{2},2,[1,2],KK2,4,[1,3]);Lz{3}=normalize(Lz{3});
Rz{3}=R;
Rz{2}=contracttensors(KK3,4,[2,4],Rz{3},2,[1,2]);Rz{2}=normalize(Rz{2});
Rz{1}=contracttensors(KK2,4,[2,4],Rz{2},2,[1,2]);Rz{1}=normalize(Rz{1});
end