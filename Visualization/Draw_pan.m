function [ Full_ax, Full_ay, Full_az,res,Body,Hand] = Draw_pan(dens,long)

%DRAW_SHAPES Summary of this function goes here
%   This function draws a pan using 2 cylinders
if nargin<1
    close all 
end
dens=4;
%% Handle of the pan
r=1; h=6.5;
res=0.35;col_res=res;
pick=1; % if pick == 2 than the Cylinder_model will draw the cylinder
%[hand_X, hand_Y, hand_Z]=Cylinder_model(r,h,1,dens);
long=1; Length=10;Width=2;Height=2;
[hand_X, hand_Y, hand_Z] = Draw_Box(dens/4,long,Length,Width,Height);

res=0.4; 
x_handle=hand_X-Length/2-2.5;y_handle=hand_Y; z_handle=hand_Z;
patch(x_handle, y_handle, z_handle,1)
hold on;
    
%% Outer body of the pan 
    %r=5; h=2;
    R1=7.5; R2=10; h=3;
    density=dens/2;
    [Con_x, Con_y, Con_z]=Cone_model( R1,R2,h,density*2 );

    Con_x=Con_x+6.15;Con_z=Con_z-1;
     patch(Con_x,Con_y,Con_z,1)
%% Inner body of the pan     
     R3=6.5; R4=8.5; h=2;
    %[Con_x, Con_y, Con_z]=Cone_model( R1,R2,h,12 );
    [Con_x2, Con_y2, Con_z2]=Cone_model( R3,R4,h,density*2 );
    Con_x2=Con_x2+6.15;Con_z2=Con_z2; 
     patch(Con_x2,Con_y2,Con_z2,1)
%% Bottom of the Pan    
    [Cir_x_plot, Cir_y_plot, Cir_z_plot]=Circle_model(R1,-1,density*2  );
    Cir_x_plot=Cir_x_plot+6.15;
     patch(Cir_x_plot,Cir_y_plot,Cir_z_plot,1)
    
     [Cir_x_plot, Cir_y_plot, Cir_z_plot]=Circle_model(R3,-1,density*2  );
     Cir_x_plot=Cir_x_plot+6.15; Cir_z_plot=Cir_z_plot+1;
     patch(Cir_x_plot,Cir_y_plot,Cir_z_plot,1)
% %% Back of the Handle - will not be sent forward since it is not possible to grab it
%     [Cir_x_plot2, Cir_y_plot2, Cir_z_plot2]=Circle_model(1,0);
%     temp=Cir_x_plot2; Cir_x_plot2=Cir_z_plot2-9.2;Cir_z_plot2=temp;
%     patch(Cir_x_plot2,Cir_y_plot2,Cir_z_plot2,1)  
    
%% The connection between the handle and the pan body
%    x_joint1=[-1.186,-1.186,-2.7,-2.7,-1.186]; y_joint1=[-0.7557,0.7557,0.7557,-0.7557,-0.7557]; z_joint1=[-1,-1,-0.6549,-0.6549,-1];
    x_joint1=[-1.186,-1.186,-2.7,-2.7]'; y_joint1=[-0.7557,0.7557,0.7557,-0.7557]'; z_joint1=[-1,-1,-0.6549,-0.6549]';
    x_joint2=[-2.7,-1.186,-2.7,-2.7]'; y_joint2=[0.5406,0.7557,0.7557,0.5406]'; z_joint2=[0.8413,-1,-0.6549,0.8413]';
    x_joint3=x_joint2; y_joint3=-y_joint2; z_joint3=z_joint2;
    x_joint=[x_joint1 x_joint2 x_joint3]; y_joint=[y_joint1 y_joint2 y_joint3]; z_joint=[z_joint1 z_joint2 z_joint3];
    patch(x_joint,y_joint,z_joint,1)
       
    %% Titels
    hold on;
    xlabel('X','FontSize',19,'FontName','Times New Roman');
    ylabel('Y','FontSize',19,'FontName','Times New Roman');
    zlabel('Z','FontSize',19,'FontName','Times New Roman');
    %title('Free Space','FontSize',19,'FontName','Times New Roman');
     view(3) ;axis equal 

    %% Output 
    ax=[x_handle Con_x2 Cir_x_plot x_joint]; 
    ay=[y_handle Con_y2 Cir_y_plot y_joint];
    az=[z_handle Con_z2 Cir_z_plot z_joint]; 
    % the second data is used for collisions only and contains the width data
    Full_ax=[x_handle Con_x Con_x2 Cir_x_plot x_joint ]; 
    Full_ay=[y_handle Con_y Con_y2 Cir_y_plot y_joint];
    Full_az=[z_handle Con_z Con_z2 Cir_z_plot z_joint ]; 
    ag=ones(size(Full_ax,2),1);
    colormap('gray') 
    Hand_X=[x_handle(1,:), x_handle(2,:), x_handle(3,:) ,x_handle(4,:) ]; 
    Hand_Y=[y_handle(1,:), y_handle(2,:), y_handle(3,:) y_handle(4,:) ]; 
    Hand_Z=[z_handle(1,:), z_handle(2,:), z_handle(3,:) ,z_handle(4,:) ]; 
    Hand=[Hand_X', Hand_Y',Hand_Z']'; 
    Body_X=[Con_x Con_x2 Cir_x_plot x_joint ]; Body_Y=[Con_y Con_y2 Cir_y_plot x_joint]; Body_Z=[Con_y Con_z2 Cir_z_plot z_joint];
    Body_X=[Body_X(1,:), Body_X(2,:), Body_X(3,:) ,Body_X(4,:) ]; 
    Body_Y=[Body_Y(1,:), Body_Y(2,:), Body_Y(3,:) ,Body_Y(4,:) ]; 
    Body_Z=[Body_Z(1,:), Body_Z(2,:), Body_Z(3,:) ,Body_Z(4,:) ]; 
    Body=[Body_X', Body_Y',Body_Z']'; 
end

