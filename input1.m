function [ A ]= input1(I1)
if I1==1
    N=(0.1)*randn(100,1);
A=[1 0;-1 0;0 0];
A1=zeros(3,2);
curves=zeros(2,3,100);
C=zeros(2,1);
s=1+(0.5)*randn(100,1);
for i=1:100
    A(:,:,i)=[1 0;-1 0;0 s(i)];
    for j=1:size(A,1)
        for k=1:size(A,2)
        A1(j,k,i)=A(j,k,i)+N(i);
        end
    end
   
      plot([A1(1,1,i),A1(2,1,i),A1(3,1,i),A1(1,1,i)],[A1(1,2,i),A1(2,2,i),A1(3,2,i),A1(1,2,i)])
     hold on
      
   
end
else
   list_dir=dir('cc*');
for dir_count=1:length(list_dir)

    cd(list_dir(dir_count).name);
    list_lpts=dir('*.lpts');
end
A=zeros(64,2);
    figure
for k=1:length(list_lpts)
    A(:,:,k)=dlmread(list_lpts(k).name);
     plot(A(:,1,k),A(:,2,k),'.')
   hold on;

   
      
end
cd ..
end

return