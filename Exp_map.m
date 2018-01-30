function [W] = Exp_map( P,V)
theta=forbprod(V,V);
theta1=norm(V,'fro');
t=V./theta;

normP=forbprod(P,P);
if theta==0
    W=P;
else
    s=cos(theta);
W=cos(theta).*P+(normP.*sin(theta)*t);

end

