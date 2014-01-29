function kinesmatic_displacement
global Displacements Velocities time
%Displacements=input('Enter distances to be evaluated inside []');
one=[0 .000000075 .000000400 .000001 .00000165 .000002175 .0000026];
Displacements=[];
for j=1:7
    for s=1:3
Displacements(j,s)=(one(j));
    end
end
%time=input('Enter time between sampled distances');
time =.001;
Velocities=size(Displacements);
Velocities(1:7,1:3)=0;
for j=2:7
    for s=1:3
Velocities(j,s)= (Displacements(j,s)-(Displacements((j-1),(s)) ))/time;
    end
end
k=1;
end