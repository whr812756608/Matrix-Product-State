function test
[H,S]=main(0,2,4,4);
disp(H)
disp(S)
%{
matlabpool('open','local',8);
D=4;
Dcut=16;
N=21;
O=zeros(N,2);
H=zeros(N,1);
S=zeros(N,1);
parfor i=1:N
    h=0.2*(i-1);
    [H(i),S(i)]=main(h,2,D,Dcut);
end
for i=1:N
    O(i,1)=0.2*(i-1);
    O(i,2)=H(i);
    O(i,3)=S(i);
end
save('result.txt','O','-ASCII')
matlabpool('close');
%}
end