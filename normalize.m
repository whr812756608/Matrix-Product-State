function T=normalize(T)
% ��һ��tensor��
d=numel(T);
t=reshape(T,[d,1]);
T=T/norm(t,'fro');
end