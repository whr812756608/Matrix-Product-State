function erg = mpoAppl(A,C)
%Applies the iMPO with matrices C to the iMPS with matrices A
d = size(A,3) ;%physical dimension
D = size(A,1); %bond dimension of iMPS 
Dc = size (C,1) ;%bond dimension of iMPO
L=reshape(A,D*D,d);
T=reshape(C,Dc*Dc*d,d);
K=L*T;
erg = reshape(K,D,D,Dc,Dc,d);
erg = permute(erg ,[3 1 4 2 5]) ;
erg = reshape(erg,D*Dc,D*Dc,d);
end
