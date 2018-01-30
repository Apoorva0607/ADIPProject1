clc;
close all;
%%Problem 1:Find preshapes for all the 100 traingles or ccshapes

%A=zeros(144,144,200);
%A=load('I1');
[y1 scale]=pre_shape(I1(:,:,:));
% figure
% 
%    for i=1:size(y1,3)
% %   plot(y1(:,1,i),y1(:,2,i),'.')
% %   hold on;
%    imagesc(y1(:,:,i));
%    pause(0.2);
%    colormap gray;
%    end
%%%%%%% Geodesic Plot
% [gg dis temp1 Y Rot]=procrustes_user(y1(:,:,1),y1(:,:,20));
% % Find the error
% err = Y - y1(:,:,20);
% err = err .* err;
% err = sum(err(:));
% rmse = sqrt(err/3)
% [T Z]=Log_map(y1(:,:,1),y1(:,:,20),temp1,Y);
% W=Exp_map(y1(:,:,1),Z);
% figure
%   for i=0:0.25:1    %%%% shows all the shapes in one plot
%   W=Exp_map(y1(:,:,1),i*Z);
%     plot(W(:,1),W(:,2),'o')
% % plot([W(1,1),W(2,1),W(3,1),W(1,1)],[W(1,2),W(2,2),W(3,2),W(1,2)])
%   hold on
%   end
%%%%%%%%%
%%%%%%%%% Frechet mean
m0=meanshape(I1);
%%%%%%%%%
%%%%%%%%% Principal Geodesic Analysis
[ F,vk1 ,eigenval,m0,pc_shape]=PGA(A);
figure
plot(sqrt(eigenval))
xlabel modes
ylabel eigenvalues
title screeplot
figure
pareto(eigenval)
xlabel('Principal Component')
ylabel('Variance Explained (%)')
%%%%%%%%%

%%%%% Projecting back to shape space
for i=1:size(vk1,2)
O1(:,:,i)=reshape(vk1(:,i),[size(y1,1),size(y1,2)]);
end
%%%%%%
figure
std_shape=sqrt(eigenval);
if I==1
index=1;
else
  index=9;  %%%% any value till 31 gives some variation in corpus callosum data
end
%%%%%% Ploting the modes of variation
figure
for i=-3:1:3
    temp = cos(i*std_shape(index))*m0+sin(i*std_shape(index))*O1(:,:,index);
%      plot([temp(1,1),temp(2,1),temp(3,1),temp(1,1)],[temp(1,2),temp(2,2),temp(3,2),temp(1,2)])
     plot(temp(:,1),temp(:,2),'LineWidth',4)
    pause(0.9)
end
%%%%%%%


    