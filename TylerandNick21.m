function TylerandNick21
T=textread ('tylerlist.txt','%s','delimiter','\n');

n=8; %number of items
x=1;
c=0;
display ('Think of an Item');
while (c<(log2(n)))
display (T{x});
A=input('Answer y or n\n','s');
if (A=='y')
    x=x*2;
    c=c+1;
elseif (A=='n')
    x=(x*2)+1;
    c=c+1;
else
  x=x;
  c=c;

end
end
display('I figured it out!')
display('You were thinking of')
display(T(x))
