function T=normalize(T)
% πÈ“ªªØtensor£ª
d=numel(T);
t=reshape(T,[d,1]);
T=T/norm(t,'fro');
end