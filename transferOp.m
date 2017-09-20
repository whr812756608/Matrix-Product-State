function E = transferOp (A,O)
%Calculates the transfer?operator of the one?site operator O and the MPS A
d = size(A,3) ; %physical dimension 
D = size(A,1) ; %bond dimension
O=O.?;
K = reshape(A,D^2 ,d) ;
K=repmat(K,1,d);
elem = reshape(O,d^2 ,1) ; 
elem = repmat(elem.',D^2,1);
K=K.*elem;
R=reshape(conj(A) ,D^2 ,d) ;
R=repmat(R,1 ,d) ; 
R=reshape(R,D^2 ,d,d) ; 
R=permute(R,[1 3 2]) ; 
R=reshape(R,D^2 ,d^2) ;
E = R*K.';
E=reshape (E,D,D,D,D) ;
E=permute(E,[1 3 2 4]); 
E=reshape(E,D^2 ,D^2) ;
end