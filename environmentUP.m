function Up=environmentUP(K1,K2,K3,D1,D)
ini=eye(D1);
ini=normalize(ini);
I=0.5*ones(D1,D1,D*D);
Up=cell(1,6);
for i=1:6
    rand('state',100*cputime*rand)
    Up{i}=rand(D1,D1,D*D)-I;
    Up{i}=normalize(Up{i});
end
%%
for theta=1:50
    Up12=contracttensors(Up{1},3,2,Up{2},3,1);  G12=contracttensors(Up12,4,[2,4],K1,4,[1,2]);
    Up34=contracttensors(Up{3},3,2,Up{4},3,1);
    Up56=contracttensors(Up{5},3,2,Up{6},3,1);
    [Up{1},Up{2}]=optimizeUP(G12,Up34,Up56,D1,ini);
    Up12=contracttensors(Up{1},3,2,Up{2},3,1);
    Up34=contracttensors(Up{3},3,2,Up{4},3,1);  G34=contracttensors(Up34,4,[2,4],K2,4,[1,2]);
    Up56=contracttensors(Up{5},3,2,Up{6},3,1);
    [Up{3},Up{4}]=optimizeUP(G34,Up56,Up12,D1,ini);
    Up12=contracttensors(Up{1},3,2,Up{2},3,1);
    Up34=contracttensors(Up{3},3,2,Up{4},3,1);
    Up56=contracttensors(Up{5},3,2,Up{6},3,1);  G56=contracttensors(Up56,4,[2,4],K3,4,[1,2]);
    [Up{5},Up{6}]=optimizeUP(G56,Up12,Up34,D1,ini);

    Up61=contracttensors(Up{6},3,2,Up{1},3,1);  G61=contracttensors(Up61,4,[2,4],K2,4,[1,2]);
    Up23=contracttensors(Up{2},3,2,Up{3},3,1);
    Up45=contracttensors(Up{4},3,2,Up{5},3,1);
    [Up{6},Up{1}]=optimizeUP(G61,Up23,Up45,D1,ini);
    Up61=contracttensors(Up{6},3,2,Up{1},3,1);
    Up23=contracttensors(Up{2},3,2,Up{3},3,1);  G23=contracttensors(Up23,4,[2,4],K3,4,[1,2]);
    Up45=contracttensors(Up{4},3,2,Up{5},3,1);
    [Up{2},Up{3}]=optimizeUP(G23,Up45,Up61,D1,ini);
    Up61=contracttensors(Up{6},3,2,Up{1},3,1);
    Up23=contracttensors(Up{2},3,2,Up{3},3,1);
    Up45=contracttensors(Up{4},3,2,Up{5},3,1);  G45=contracttensors(Up45,4,[2,4],K1,4,[1,2]);
    [Up{4},Up{5}]=optimizeUP(G45,Up61,Up23,D1,ini);
end
end