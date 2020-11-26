function dydt=odefun(t,y)
N=300;
S=4.5283;
sigma=4;
p=4;
q=3;
b=1/sigma;
a=((q/p)-(b*S))/S^2;
%c=-d/(2*S);


dydt=zeros(N,1);
 dydt(1)= q-p*(a.*y(1).^2+b.*y(1));

for k=2:N
 dydt(k)= p*(a.*y(k-1).^2+b.*y(k-1))- p*(a.*y(k).^2+b.*y(k));


end


end
