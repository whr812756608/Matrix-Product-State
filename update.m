function [T,lx,ly,lz]=update(T,lx,ly,lz,h,d,D,dt,N)
G=Hamiltonian(h,dt,d);
%%
for phi=1:N
    [T{2},T{1},lx{1}]=updatex(T{2},T{1},lx{1},ly{3},lz{2},ly{1},lz{1},D,G);
    [T{6},T{3},lx{2}]=updatex(T{6},T{3},lx{2},ly{1},lz{3},ly{2},lz{2},D,G);
    [T{4},T{5},lx{3}]=updatex(T{4},T{5},lx{3},ly{2},lz{1},ly{3},lz{3},D,G);
    [T{1},T{6},ly{1}]=updatey(T{1},T{6},ly{1},lx{1},lz{1},lx{2},lz{3},D,G);
    [T{3},T{4},ly{2}]=updatey(T{3},T{4},ly{2},lx{2},lz{2},lx{3},lz{1},D,G);
    [T{5},T{2},ly{3}]=updatey(T{5},T{2},ly{3},lx{3},lz{3},lx{1},lz{2},D,G);
    [T{4},T{1},lz{1}]=updatez(T{4},T{1},lz{1},lx{3},ly{2},lx{1},ly{1},D,G);
    [T{2},T{3},lz{2}]=updatez(T{2},T{3},lz{2},lx{1},ly{3},lx{2},ly{2},D,G);
    [T{6},T{5},lz{3}]=updatez(T{6},T{5},lz{3},lx{2},ly{1},lx{1},ly{1},D,G);
    
    [T{6},T{5},lz{3}]=updatez(T{6},T{5},lz{3},lx{2},ly{1},lx{1},ly{1},D,G);
    [T{2},T{3},lz{2}]=updatez(T{2},T{3},lz{2},lx{1},ly{3},lx{2},ly{2},D,G);
    [T{4},T{1},lz{1}]=updatez(T{4},T{1},lz{1},lx{3},ly{2},lx{1},ly{1},D,G);
    [T{5},T{2},ly{3}]=updatey(T{5},T{2},ly{3},lx{3},lz{3},lx{1},lz{2},D,G);
    [T{3},T{4},ly{2}]=updatey(T{3},T{4},ly{2},lx{2},lz{2},lx{3},lz{1},D,G);
    [T{1},T{6},ly{1}]=updatey(T{1},T{6},ly{1},lx{1},lz{1},lx{2},lz{3},D,G);
    [T{4},T{5},lx{3}]=updatex(T{4},T{5},lx{3},ly{2},lz{1},ly{3},lz{3},D,G);
    [T{6},T{3},lx{2}]=updatex(T{6},T{3},lx{2},ly{1},lz{3},ly{2},lz{2},D,G);
    [T{2},T{1},lx{1}]=updatex(T{2},T{1},lx{1},ly{3},lz{2},ly{1},lz{1},D,G);
end
end