function [ erg , fin_err ] = ITE_Ising () 
format long ;
J=1;
g = 1.05;
accuracy = 1e-10; %Accuracy for the detection of convergence and when to break up the optimization
maxsteps = 100;
steprange = 0.025;%size of single time?step in the Trotter decomposition 
D = 5; %Bond dimension of MPS
A(: ,: ,1)=1; %Initial state
A(: ,: ,2)=0;
en = zeros(maxsteps,1) ; 
time = 2:1: maxsteps ;
err = zeros(maxsteps ,1) ;
exactEnerg = exactIsingEnergy(J,g);
en(1)=exactEnerg+1; err (1)=1;
minsteprange = 1e-5; maxdim = 20;
range_count = 0; dim_count = 0 ;
h=2;
while (err(h-1)>=accuracy && h<maxsteps)
A = evolve(A,D,1,steprange ,J,g); %Calculates 1 time?step in imaginary time 
[A,v] = normalize(A); %Normalizes the state
energ = energyIs(A,v,J,g); %Calculates energy of the state
en(h) = energ;
err(h)= abs((energ-exactEnerg)/exactEnerg); %Relative error compared to exact ener
abs((energy - exactEnerg)/exactEnerg)
enf = en; corrf = cor;
save(strcat(sprintf('en%d%d%d%d%d%d%d' ,round(100*J) ,round(100*g) ,D)) , 'enf');
save(strcat(sprintf('en%d%d%d%d%d%d%d' ,round(100*J) ,round(100*g) ,D)) , 'corrf');
if h>=maxsteps
disp ( ' Maxstep_reached ' ) ;
end
erg = en(h-1);
fin_err = abs(en(h-1)-exactEnerg)
end
 


