function [ gg dis temp1, O1 ,rot]= procrustes_user(data1,data2)
 C=data1'*data2;
[S,V,D]=svd(C);
rot=S*transpose(D);
O=S*transpose(D)*data2';% the final minimizer
O1=O';
gg=diag(V);
d=sum(log(gg).^2);
dis=sqrt(d);
temp1=sum(diag(V));
if temp1==1;
   temp1=temp1-10^(-8);
end
end
