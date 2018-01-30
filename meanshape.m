function [ m ] = meanshape( p)

for i=1:size(p,3)
    p(:,:,i)=pre_shape(p(:,:,i));
end

m0 = p(:,:,1);

epsilon = 1e-7;
[d,d1,n] = size(p);
X0 = zeros(d,d1);

for i=1:n
    [gg dis temp2 Y_1 rot]=procrustes_user(m0,p(:,:,i));
    [t Z2]=Log_map(m0,p(:,:,i),temp2,Y_1);
    X0 = X0 + Z2;
end
X0 = X0/n;
X = X0;
m = Exp_map(m0,X);
m0 = m;
num=0;
while(num<=500)
    num=num+1;
    X = zeros(d,d1);
    for i=1:n  
       [gg dis temp2 Y_1 rot]=procrustes_user(m0,p(:,:,i));
       [t Z2]= Log_map(m0,p(:,:,i),temp2,Y_1);
        X = X + Z2 ;
    end
    X = X/n;
    m = Exp_map(m0,X);
    if(norm(X,2)>norm(X0,2))
        X = X0;
        
    end
    X0 = X;
    m0 = m;
end