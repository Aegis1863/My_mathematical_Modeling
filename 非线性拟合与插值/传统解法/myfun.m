function f = myfun(a)
    x = [0.1  0.2  0.3  0.4  0.5  0.6  0.7  0.8  0.9  1.0 ]; 
    y = [2.3201  2.647  2.9707  3.2885  3.6008  3.909  4.2147  4.5191 4.8232  5.1275 ];
    f = a(1).*x+a(2).*(x.^2).*exp(-a(3)*x)+a(4) - y;
end