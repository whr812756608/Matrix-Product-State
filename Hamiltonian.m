function G=Hamiltonian(h,dt,d)
% Pauli Matrix
sigmax=[0,1;1,0];
sigmaz=[1,0;0,-1];
E=eye(2);

H=-kron(sigmaz,sigmaz)-h/3*(kron(sigmax,E)+kron(E,sigmax));
G=expm(-H*dt);
G=reshape(G,[d,d,d,d]);
end
