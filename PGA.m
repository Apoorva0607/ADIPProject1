function [ F, vk ,eigenval,m0,pc_shape] = PGA( shape )
[m d n]=size(shape);

for i=1:size(shape,3)
    p(:,:,i)=pre_shape(shape(:,:,i));
end
S=zeros((m*d),(m*d));
m0=meanshape(shape);
for i=1:n
    [gg dis temp2 Y_1 rot]=procrustes_user(m0,p(:,:,i));
    [t Z2]=Log_map(m0,p(:,:,i),temp2,Y_1);
        F(:,:)=reshape(Z2,size(Z2,1)*size(Z2,2),1);
          S=S+(F*F')./(n-1);
    
end

     [vk sigma D]=svd(S);
      pc_shape=(S./sqrt(n-1))*vk./repmat(sqrt(diag(sigma)'),m*d,1);
  
    eigenval=diag(sigma)



 
end

