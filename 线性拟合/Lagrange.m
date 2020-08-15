function yy=Lagrange(x0,y0,x)
	%Lagrange插值函数，x为向量
	m=length(x0);
	n=length(y0);
	if m ~= n  
        error('向量x与y的长度必须一致'); 
    end
	s=0;    %即s=zeros(1,length(x)); 
	for i=1 : n
        z=ones(1,length(x));
        for j=1 : n
            if j ~= i
                z=z.*(x-x0(j))./(x0(i)-x0(j));
           end
        end
        s=s+z*y0(i);
    end
	yy=s;
end