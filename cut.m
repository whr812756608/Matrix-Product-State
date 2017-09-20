function V=cut(T)
[V,S]=eig(T);
V=V*sqrt(S);
V=permute(V,[2,1]);
end