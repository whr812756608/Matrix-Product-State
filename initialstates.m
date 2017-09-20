function [T,lx,ly,lz]=initialstates(dphy,D)
%%
T=cell(1,6);
lx=cell(1,3);
ly=cell(1,3);
lz=cell(1,3);

I=0.5*ones(dphy,D,D,D);
for i=1:6
    rand('state',100*cputime*rand)
    T{i}=ones(dphy,D,D,D)-I;
    T{i}=normalize(T{i});
end
%%
    function R=diagrand(x)
        R=ones(1,x);
        R=normalize(R);
        R=diag(R);
    end
for i=1:3
    lx{i}=diagrand(D);
    ly{i}=diagrand(D);
    lz{i}=diagrand(D);
end
end