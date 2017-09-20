function energy = erg_truncation (C,D)
opts.disp = 0;
opts . issym = 1;
opts.isherm = 1;
dBig = size(C,1);
d = size(C,3);
if(dBig<=D)
    energy = C;
else
E = transferOp(C,eye(d));
[x,e] = eigs(E,1,'lm',opts);
xr = reshape(x,dBig,dBig);
[V,S] = svd(xr);
P = V(1:end,1:D);
C = permute(C,[1 3 2]) ;
C = reshape (C, dBig*d , dBig ) ; C=C*P ;
C = reshape(C,dBig,d,D);
C = permute(C,[1 3 2]) ;
C = reshape(C,dBig,D*d);
C = P'*C;
energy = reshape(C,D,D,d); energy = energy/sqrt(e);
end
end