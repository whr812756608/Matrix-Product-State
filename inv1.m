function A1=inv1(A)
% Çó¾ØÕóµÄÄæ£»
dim=size(A);
[U,S,V]=svd(A);
for i=1:dim(1)
    if abs(S(i,i))>1e-40
        S(i,i)=1/S(i,i);
    else
        S(i,i)=0;
    end
end
A1=V*S*U';
end