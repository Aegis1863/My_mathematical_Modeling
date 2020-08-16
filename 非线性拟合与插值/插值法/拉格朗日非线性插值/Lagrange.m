function yy=Lagrange(x0,y0,x)
	%Lagrange��ֵ������xΪ����
	m=length(x0);
	n=length(y0);
	if m ~= n  
        error('����x��y�ĳ��ȱ���һ��'); 
    end
	s=0;    %��s=zeros(1,length(x)); 
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