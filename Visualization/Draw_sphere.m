function [ Full_x, Full_y, Full_z,res,col_res,ag,ax, ay, az ] = Draw_sphere(density,long )
%DRAW_SPHEERE Summary of this function goes here
%   Detailed explanation goes here
%close all
r(1)=4;
if nargin < 1
    density=11; % 10 , 9 or 7
    res=0.35;
else
      if density==1
          density=10;
           res=0.4;  col_res=0.35;
       end
       if density==2
           density=9;
                res=0.42; col_res=0.37;
       end
       if density==3 
           density=7;
            res=0.85; col_res=0.65;
       end           
end
if density==4
          density=11;           res=0.4;  col_res=0.35;
end
n=density; 

theta = -pi-0.02:pi/n:pi-0.02;
phi = -pi/2-0.01:pi/(n*2):pi/2-0.01;
ax=[]; ay=[]; az=[];ag=[];

for i=1:1:length(theta)-1
    for j=1:1:length(phi)-1
              
      [ X(i,1),Y(i,1),Z(i,1) ] = sph2cart(theta(i),phi(j),r(1));
      [ X(i,2),Y(i,2),Z(i,2) ] = sph2cart(theta(i),phi(j+1),r(1));
      [ X(i,3),Y(i,3),Z(i,3) ] = sph2cart(theta(i+1),phi(j+1),r(1));
      [ X(i,4),Y(i,4),Z(i,4) ] = sph2cart(theta(i+1),phi(j),r(1));
%       M=mod(i*j+j,3);
%       if M==0
%           g=0;
%       else
%           if M==1
%               g=0.5;
%           else
%               if M==2
%                   g=1;
%               else
%                    %g=1;
%               end
%           end
%       end
g=1;
      ax=[ax X(i,:)']; ay=[ay Y(i,:)']; az=[az Z(i,:)']; ag=[ag g];
     end
end

patch(ax,ay,az,1); 
hold on;
colormap gray
view (3)
xlabel('X [cm]','FontSize',19,'FontName','Times New Roman');
ylabel('Y [cm]','FontSize',19,'FontName','Times New Roman');
zlabel('Z [cm]','FontSize',19,'FontName','Times New Roman');
view(3) ;axis equal
ag(:)=1;
Full_x=ax; Full_y=ay; Full_z=az;
end  

