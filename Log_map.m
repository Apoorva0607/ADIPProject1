function [ T Z] = Log_map( P,Q,temp1,Y)

t=zeros(size(Y,1),size(Y,2));
 t(:,:)=Y-P.*temp1;
  T=t/norm(t,'fro');
  g1=real(acos(temp1));
  Z=g1.*T; %%% tangent vector
end

