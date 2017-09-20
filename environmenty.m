function [Upy,Dny,Ly,Ry]=environmenty(K,D1,D)
% KA和KB收缩掉zbond，honeycomb lattice变成squar lattice
K1=contracttensors(K{1},3,2,K{6},3,2);
K1=permute(K1,[1,2,4,3]);
K1=normalize(K1);
K2=contracttensors(K{3},3,2,K{4},3,2);
K2=permute(K2,[1,2,4,3]);
K2=normalize(K2);
K3=contracttensors(K{5},3,2,K{2},3,2);
K3=permute(K3,[1,2,4,3]);
K3=normalize(K3);

Up=environmentUP(K1,K3,K2,D1,D);
Dn=environmentDN(K1,K3,K2,D1,D);
%% z bond's environment;
Upy=cell(1,3);
Dny=cell(1,3);
Ly=cell(1,3);
Ry=cell(1,3);
for i=1:3
    Upy{i}=contracttensors(Up{2*i-1},3,2,Up{2*i},3,1);
    Upy{i}=normalize(Upy{i});
    Dny{i}=contracttensors(Dn{2*i-1},3,2,Dn{2*i},3,1);
    Dny{i}=normalize(Dny{i});
end

KK1=contracttensors(Upy{1},4,[2,4],K1,4,[1,2]);
KK1=contracttensors(KK1,4,[3,4],Dny{1},4,[2,4]);
KK2=contracttensors(Upy{2},4,[2,4],K3,4,[1,2]);
KK2=contracttensors(KK2,4,[3,4],Dny{2},4,[2,4]);
KK3=contracttensors(Upy{3},4,[2,4],K2,4,[1,2]);
KK3=contracttensors(KK3,4,[3,4],Dny{3},4,[2,4]);

KK=contracttensors(KK1,4,[2,4],KK2,4,[1,3]);
KK=contracttensors(KK,4,[3,4],KK3,4,[1,3]);

ini=eye(D1);
ini=normalize(ini);

L=ini;R=ini;
for phi=1:25
    Lt=contracttensors(L,2,[1,2],KK,4,[1,2]);  Lt=normalize(Lt);
    Rt=contracttensors(KK,4,[3,4],R,2,[1,2]);  Rt=normalize(Rt);
    if (tensorerror(Lt,L)<1e-10)&&(tensorerror(Rt,R)<1e-10),break;end
    L=Lt;                               R=Rt;
end

Ly{1}=L;
Ly{2}=contracttensors(Ly{1},2,[1,2],KK1,4,[1,3]);Ly{2}=normalize(Ly{2});
Ly{3}=contracttensors(Ly{2},2,[1,2],KK2,4,[1,3]);Ly{3}=normalize(Ly{3});
Ry{3}=R;
Ry{2}=contracttensors(KK3,4,[2,4],Ry{3},2,[1,2]);Ry{2}=normalize(Ry{2});
Ry{1}=contracttensors(KK2,4,[2,4],Ry{2},2,[1,2]);Ry{1}=normalize(Ry{1});
end