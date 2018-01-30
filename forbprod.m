function [ C ] = forbprod( X,Y )
c=0;
for i=1:size(X,1)
    for j=1:size(X,2)
        c=c+X(i,j)*Y(i,j);
       
    end
end
C=sqrt(c);
end

