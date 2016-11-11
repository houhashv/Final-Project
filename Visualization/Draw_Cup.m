function [ Full_ax, Full_ay, Full_az,res,col_res,ag,ax,ay,az ] = Draw_Cup()
 
%DRAW_SHAPES Summary of this function goes here
%   This function draws a pan using 2 cylinders
%close all
density=1;
    %% The Cup
    R1=3; R2=4.5; h=10;
    if nargin<1
        %2.7 , 2.4 or 1.5
        density=2.7;
        if density==1.5
            res=0.8;
        else
            res=0.3;
        end
    else
        if density==1
            density=2.7;
           res=0.35;
        end
        if density==2
            density=2.4 ;
                res=0.4;
        end
        if density==3
            density=1.5 ;
            res=0.85;
        end           
    end
col_res=res;
    [Con_x, Con_y, Con_z]=Cone_model( R1,R2,h,density*2 );
    %% the bottom
    z=min(min(Con_z));
    [Cir_x, Cir_y, Cir_z]=Circle_model(R1,z ,density *2);
          
     %% the handle 
     
     width=3;     z=max(max(Con_z))-1;
     [Rec_x, Rec_y, Rec_z]=Rect_model( width,R2-0.25,z);

    %line(Cyl_x,Cyl_y,Cyl_z,'Color','k')
    %figure
    Con_z=Con_z-5;
    patch(Con_x,Con_y,Con_z,'c')
    %line(Con_x,Con_y,Con_z,'Color','c')
    hold on;  
    %line(Cir_x,Cir_y,Cir_z,'Color','k'); axis equal; view(3)
    Cir_z=Cir_z-5;
    patch(Cir_x,Cir_y,Cir_z,'y'); axis equal; view(3)
    Rec_z=Rec_z-5;
    patch(Rec_x,Rec_y,Rec_z,'y'); axis equal; view(3) 
    colormap gray
    %line(Rec_x,Rec_y,Rec_z,'Color','k'); axis equal; view(3)
    %patch(x1,y1,z1,1)  
    xlabel('X','fontsize',18);
    ylabel('Y','fontsize',18); 
    zlabel('Z','fontsize',18);
    Full_ax=[Con_x Cir_x Rec_x]; Full_ay=[Con_y Cir_y Rec_y]; Full_az=[Con_z Cir_z Rec_z]; 
    ax=[Con_x Rec_x]; ay=[Con_y Rec_y]; az=[Con_z Rec_z]; 
    ag=ones(length(ax),1);
%    X.x2=x2;Y.y2=y2;Z.z2=z2;

  
end 

