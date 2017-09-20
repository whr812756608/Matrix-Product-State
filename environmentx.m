function [Upx,Dnx,Lx,Rx]=environmentx(K,D1,D)
% KA和KB收缩掉zbond，honeycomb lattice变成squar lattice
K1=contracttensors(K{2},3,1,K{1},3,1);
K1=permute(K1,[2,1,3,4]);
K1=normalize(K1);
K2=contracttensors(K{6},3,1,K{3},3,1);
K2=permute(K2,[2,1,3,4]);
K2=normalize(K2);
K3=contracttensors(K{4},3,1,K{5},3,1);
K3=permute(K3,[2,1,3,4]);
K3=normalize(K3);

Up=environmentUP(K1,K2,K3,D1,D);
Dn=environmentDN(K1,K2,K3,D1,D);
%% z bond's environment;
Upx=cell(1,3);
Dnx=cell(1,3);
Lx=cell(1,3);
Rx=cell(1,3);
for i=1:3
    Upx{i}=contracttensors(Up{2*i-1},3,2,Up{2*i},3,1);
    Upx{i}=normalize(Upx{i});
    Dnx{i}=contracttensors(Dn{2*i-1},3,2,Dn{2*i},3,1);
    Dnx{i}=normalize(Dnx{i});
end

KK1=contracttensors(Upx{1},4,[2,4],K1,4,[1,2]);
KK1=contracttensors(KK1,4,[3,4],Dnx{1},4,[2,4]);
KK2=contracttensors(Upx{2},4,[2,4],K2,4,[1,2]);
KK2=contracttensors(KK2,4,[3,4],Dnx{2},4,[2,4]);
KK3=contracttensors(Upx{3},4,[2,4],K3,4,[1,2]);
KK3=contracttensors(KK3,4,[3,4],Dnx{3},4,[2,4]);

KK=contracttensors(KK1,4,[2,4],KK2,4,[1,3]);
KK=contracttensors(KK,4,[3,4],KK3,4,[1,3]);

ini=eye(D1,D1);
ini=normalize(ini);

L=ini;R=ini;
for phi=1:50
    Lt=contracttensors(L,2,[1,2],KK,4,[1,2]);   Lt=normalize(Lt);
    Rt=contracttensors(KK,4,[3,4],R,2,[1,2]);   Rt=normalize(Rt);
    if (tensorerror(Lt,L)<1e-10)&&(tensorerror(Rt,R)<1e-10),break;end
    L=Lt;                               R=Rt;
end

Lx{1}=L;
Lx{2}=contracttensors(Lx{1},2,[1,2],KK1,4,[1,3]);Lx{2}=normalize(Lx{2});
Lx{3}=contracttensors(Lx{2},2,[1,2],KK2,4,[1,3]);Lx{3}=normalize(Lx{3});
Rx{3}=R;
Rx{2}=contracttensors(KK3,4,[2,4],Rx{3},2,[1,2]);Rx{2}=normalize(Rx{2});
Rx{1}=contracttensors(KK2,4,[2,4],Rx{2},2,[1,2]);Rx{1}=normalize(Rx{1});
end