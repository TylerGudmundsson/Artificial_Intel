function Kinematics
global ax ay az Vx Vy Vz Dx Dy Dz
ax=[0 0.3 0.4 0 -0.2 -0.1 0];
ay=[0 0.3 0.4 0 -0.2 -0.1 0];
az=[0 0.3 0.4 0 -0.2 -0.1 0];
%ax=input('Input The Values for ax inside []: ');
%ay=input('Input The Values for ay inside []: ');
%az=input('Input The Values for az inside []: ');
Vx=size(ax);
Vy=size(ay);
Vz=size(az);
Dx=size(ax);
Dy=size(ay);
Dz=size(az);
X=[];
Y=[];
Z=[];

X=Computation(ax,Vx);
Y=Computation(ay,Vy);
Z=Computation(az,Vz);
c=0;
for c=1:7
    Vx(1,c)=X(1,c);
    Vy(1,c)=Y(1,c);
    Vz(1,c)=Z(1,c);
end
X=Computation(Vx,Dx);
Y=Computation(Vy,Dy);
Z=Computation(Vz,Dz);
c=0;
for c=1:7
    Dx(1,c)=X(1,c);
    Dy(1,c)=Y(1,c);
    Dz(1,c)=Z(1,c);
end
Vx
Dx
Vy
Dy
Vz
Dz

k=1;
end



function V2=Computation(matrix1,matrix2)
V2=[];
Delta1=0;
Average1=0;
test_rate=.001; 
k=1;
matrix2(1,1)=0;
for i = 2:7,
    Average1= ((matrix1(1,i))+(matrix1(1,(i-1))))/2;
    Delta1= Average1*test_rate;
    matrix2(1,i)=matrix2(1,(i-1))+Delta1;
end
k=1;
t=0;
for t=1:7,
    V2(1,t)=matrix2(1,t);
end
k=1;
end
    
    