function GeneticEvolution2

numofchromosome=10;
lengthofchromosome=16;
numofgenerations=100;
Pc=0.7;
Pm=0.01;
v(1:numofchromosome,1:lengthofchromosome)= ceil(2*rand(numofchromosome,lengthofchromosome))-1;
nv=v;
fitnessfunction=zeros(1,numofgenerations);
xx=[];
yy=[];
for j1=1 :   numofgenerations,
for i = 1 : numofchromosome,
    pp=2.^(8:-1:1)/2;
    x=sum(v(i,1:8).* pp); y=sum(v(i,9:16).*pp);
    xx(i)=x*0.0235 -3; yy(i)=y*0.0235 -3;
end
f=(1-xx).^2 .* exp(-xx.^2 -(yy+1).^2)-(xx-xx.^3-yy.^3).* exp(-xx.^2-yy.^2);
fitnessfunction(j1)=mean(f);
f_r=f*100/sum(f);
probchart=cumsum(f_r);
probchart=probchart/probchart (numofchromosome);
for i1=1 :2: numofchromosome,
    k1=1;
    k2=1;
    while k1==k2,
        r1=rand(1,1);
        r2=rand(1,1);
        for i=1 :numofchromosome-1,
            if (probchart (i) <=r1 & r1<probchart(i+1)),
                k1=i+1;
            end
            if (probchart(i) <r2 & r2<probchart(i+1)),
                k2=i+1;
            end
        end
    end
    if rand(1,1)<Pc
        M=ceil (lengthofchromosome*rand(1,1));
        nv(i1,1:M-1)=v(k1,1:M-1);
        nv(i1,M:lengthofchromosome)= v(k2,M:lengthofchromosome);
        nv(i1+1,1:M-1) = v(k2,1:M-1);
        nv(i1+1,M:lengthofchromosome)= v(k1,M:lengthofchromosome);
    else
        nv(i1,:)=v(k1,:);
        nv(i1+1,:)=v(k2,:);
    end
    if rand(1,1) < Pm
        k=ceil(lengthofchromosome*rand(1,1));
    mutated
        kv=nv(i1,k);
        nv(i1,k)=mod(kv+1,2);
    end
    if rand(1,1)<Pm
        k=ceil(lengthofchromosome*rand(1,1));
    mutated
        kv=nv(i1+1,k);
        nv(i1,k)=mod(kv+1,2);
    end
end
v=nv;
end
plot(fitnessfunction)
xlablel('generation number')
ylabel('fitnessvalue= f(x)')
title('fitness value convergence')
b=1;
        