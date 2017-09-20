function A = evolve (A_in,D, t_fin,steprange, J,g)

N = t_fin/steprange;
persistent T;
persistent stepr_temp ;
 if isempty(T) || stepr_temp ~= steprange
     cg = cosh( steprange*J*g/2) ; sg = sinh(steprange*J*g/2);
     c = cosh(steprange*J); s = sinh(steprange*J);
 T(:,:,1,1) = cg*cg*[c,sqrt(s*c);sqrt(s*c),s] + sg*sg*[c,-sqrt(s*c);-sqrt(s*c),s]; T(:,:,2,1) = 2*cg*sg*[c,0;0,s];
 T(:,:,1,2) = 2*cg*sg*[c,0;0,s];
 T(:,:,2,2) = cg*cg*[c,-sqrt(s*c);-sqrt(s*c),s] + sg*sg*[c,sqrt(s*c);sqrt(s*c),s];
 end

stepr_temp = steprange 
A = mpoAppl(A_in,T); 
A = truncation (A,D) ;
 for k=2:N
   A = mpoAppl(A,T) ; 
   A = truncation(A,D);
 end 
end