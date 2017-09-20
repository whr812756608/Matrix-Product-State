function [U1,U2]=optimizeUP(G1,G2,G3,D1,ini)
% trace掉环境的指标；
TT1=contracttensors(conj(G1),4,[3,4],G1,4,[3,4]);
TT2=contracttensors(conj(G2),4,[2,4],G2,4,[2,4]);
TT3=contracttensors(conj(G3),4,[2,4],G3,4,[2,4]);

TT=contracttensors(TT1,4,[2,4],TT2,4,[1,3]);
TT=contracttensors(TT,4,[3,4],TT3,4,[1,3]);
% 左右的环境；
tl=ini; tr=ini;
for phi=1:25
    tlt=contracttensors(tl,2,[1,2],TT,4,[1,2]); tlt=normalize(tlt);
    trt=contracttensors(TT,4,[3,4],tr,2,[1,2]); trt=normalize(trt);
    if (tensorerror(tlt,tl)<1e-10)&&(tensorerror(trt,tr)<1e-10),break;end
    tl=tlt;tr=trt;
end
tl1=tl;
tr3=tr;
tr2=contracttensors(TT3,4,[2,4],tr3,2,[1,2]);  tr2=normalize(tr2);
tr1=contracttensors(TT2,4,[2,4],tr2,2,[1,2]);  tr1=normalize(tr1);
% 环境做cut；
tl1=cut(tl1);tl1inv=inv1(tl1);
tr1=cut(tr1);tr1inv=inv1(tr1);
% 左右的环境乘进矩阵里,and svd；
G1=contracttensors(tl1,2,2,G1,4,1);
G1=contracttensors(G1,4,2,tr1,2,2);
G1=permute(G1,[1,2,4,3]);
G1=normalize(G1);
[V1,l,V2]=psvd(G1,D1);
V1=contracttensors(V1,3,3,sqrt(l),2,1);
V2=contracttensors(sqrt(l),2,2,V2,3,1);
% 调整回原来的tensor
U1=contracttensors(tl1inv,2,2,V1,3,1);
U1=permute(U1,[1,3,2]);
U1=normalize(U1);
U2=contracttensors(V2,3,2,tr1inv,2,2);
U2=permute(U2,[1,3,2]);
U2=normalize(U2);
end