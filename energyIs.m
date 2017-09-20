function erg = energyIs(A,v,J,g)
%Calculates the energy of a iMPS for the one?dimensional Ising model 
%in thethermodynamic limit (translational invariant). 
% H = ?J?sum(sig(i)_z?sig(i+1)_z + g?sig(i)_x)
opts.disp = 0;
opts.issym = 1;
opts.isherm = 1; %symmetric and real?valued
d = size(A,3); %dimension of one site 
sigmax=[0,1;1,0];
sigmaz = [1,0;0,-1];
E = transferOp(A,eye(d));
vr = v;
[vl,el] = eigs(E',1,'lm',opts);
Eox=transferOp (A, sigx ) ; energx = vl'*Eox*vr;
energx = energx /( vl'*E*vr ) ;

Eoz = transferOp(A,sigz); energz = vl'*Eoz*Eoz*vr; energz = energz /( vl'*E*E*vr);
erg = -J*(energz+g*energx);
end