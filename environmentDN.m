function Dn=environmentDN(K1,K2,K3,D1,D)
ini=eye(D1,D1);
ini=normalize(ini);
I=0.5*ones(D1,D1,D*D);
Dn=cell(1,6);
for i=1:6
    rand('state',100*sum(clock)*rand)
    Dn{i}=rand(D1,D1,D*D)-I;
    Dn{i}=normalize(Dn{i});
end
%%
for theta=1:50
    Dn12=contracttensors(Dn{1},3,2,Dn{2},3,1);  G12=contracttensors(K1,4,[3,4],Dn12,4,[2,4]);
    Dn34=contracttensors(Dn{3},3,2,Dn{4},3,1);
    Dn56=contracttensors(Dn{5},3,2,Dn{6},3,1);
    [Dn{1},Dn{2}]=optimizeDN(G12,Dn34,Dn56,D1,ini);
    Dn12=contracttensors(Dn{1},3,2,Dn{2},3,1);
    Dn34=contracttensors(Dn{3},3,2,Dn{4},3,1);  G34=contracttensors(K2,4,[3,4],Dn34,4,[2,4]);
    Dn56=contracttensors(Dn{5},3,2,Dn{6},3,1);
    [Dn{3},Dn{4}]=optimizeDN(G34,Dn56,Dn12,D1,ini);
    Dn12=contracttensors(Dn{1},3,2,Dn{2},3,1);
    Dn34=contracttensors(Dn{3},3,2,Dn{4},3,1);
    Dn56=contracttensors(Dn{5},3,2,Dn{6},3,1);  G56=contracttensors(K3,4,[3,4],Dn56,4,[2,4]);
    [Dn{5},Dn{6}]=optimizeDN(G56,Dn12,Dn34,D1,ini);
    
    Dn61=contracttensors(Dn{6},3,2,Dn{1},3,1);  G61=contracttensors(K2,4,[3,4],Dn61,4,[2,4]);
    Dn23=contracttensors(Dn{2},3,2,Dn{3},3,1);
    Dn45=contracttensors(Dn{4},3,2,Dn{5},3,1);
    [Dn{6},Dn{1}]=optimizeDN(G61,Dn23,Dn45,D1,ini);
    Dn61=contracttensors(Dn{6},3,2,Dn{1},3,1);
    Dn23=contracttensors(Dn{2},3,2,Dn{3},3,1);  G23=contracttensors(K3,4,[3,4],Dn23,4,[2,4]);
    Dn45=contracttensors(Dn{4},3,2,Dn{5},3,1);
    [Dn{2},Dn{3}]=optimizeDN(G23,Dn45,Dn61,D1,ini);
    Dn61=contracttensors(Dn{6},3,2,Dn{1},3,1);
    Dn23=contracttensors(Dn{2},3,2,Dn{3},3,1);
    Dn45=contracttensors(Dn{4},3,2,Dn{5},3,1);  G45=contracttensors(K1,4,[3,4],Dn45,4,[2,4]);
    [Dn{4},Dn{5}]=optimizeDN(G45,Dn61,Dn23,D1,ini);
end
end