function O=bondx(Up,Down,L,R,TA,TB,OA,OB,D)
%%
TA1=permute(conj(TA),[4,3,2,1]);
sigmaA=contracttensors(OA,2,2,TA,4,1);
sigmaA=contracttensors(TA1,4,4,sigmaA,4,1);
sigmaA=permute(sigmaA,[3,4,2,5,1,6]);
sigmaA=reshape(sigmaA,[D*D,D*D,D*D]);
IA=contracttensors(TA1,4,4,TA,4,1);
IA=permute(IA,[3,4,2,5,1,6]);
IA=reshape(IA,[D*D,D*D,D*D]);

TB1=permute(conj(TB),[4,3,2,1]);
sigmaB=contracttensors(OB,2,2,TB,4,1);
sigmaB=contracttensors(TB1,4,4,sigmaB,4,1);
sigmaB=permute(sigmaB,[3,4,2,5,1,6]);
sigmaB=reshape(sigmaB,[D*D,D*D,D*D]);
IB=contracttensors(TB1,4,4,TB,4,1);
IB=permute(IB,[3,4,2,5,1,6]);
IB=reshape(IB,[D*D,D*D,D*D]);
%%
K=contracttensors(sigmaA,3,1,sigmaB,3,1);
K=permute(K,[2,1,3,4]);
K=contracttensors(Up,4,[2,4],K,4,[1,2]);
K=contracttensors(K,4,[3,4],Down,4,[2,4]);
K=contracttensors(L,2,[1,2],K,4,[1,3]);
K=contracttensors(K,2,[1,2],R,2,[1,2]);

I=contracttensors(IA,3,1,IB,3,1);
I=permute(I,[2,1,3,4]);
I=contracttensors(Up,4,[2,4],I,4,[1,2]);
I=contracttensors(I,4,[3,4],Down,4,[2,4]);
I=contracttensors(L,2,[1,2],I,4,[1,3]);
I=contracttensors(I,2,[1,2],R,2,[1,2]);

O=K/I;
end