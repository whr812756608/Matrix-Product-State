function E = exactIsingEnergy(J,g)
%Calculates the exact energy of the ground state
    E = -1/(4*pi)*quad(@F,-pi,pi,1E-10);
function y=F(x)
    y=2*J*sqrt(1+g*g-2*g*cos(x)) ;
end ;
end
