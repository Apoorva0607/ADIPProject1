% Find the Pre_shape for any arbitary shape
function [y1  scale]=pre_shape(s)
o=mean(s);
%y=s-repmat(o,[1 200]);% centerlize the data.
%y=zeros(size(s));
y=s-repmat(o,size(s,1),1);
 for i=1:size(s,3)
 % y(:,:,i)=s(:,:,i)-o;   
scale=norm(y(:,:,i),'fro');
y1(:,:,i)=y(:,:,i)/scale;
% subplot(3,1,2)
%  plot([y(1,1,i),y(2,1,i),y(3,1,i),y(1,1,i)],[y(1,2,i),y(2,2,i),y(3,2,i),y(1,2,i)]);
%  hold on;
 end
end

