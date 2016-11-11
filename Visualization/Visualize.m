function[]=Visualize(mixture,obj)
% this function makes the plots of the distribution of positions,
% orientations and 
%created by: yossi hohashvili
%email: yossihohashvili1@gmail.com
%january 2016
color=['y','m','c','r','g','b','k'];
pts=mixture.points';
%scatter plot of positions
scatter3(pts(:,1),pts(:,2),pts(:,3),'MarkerFaceColor',[0 .75 .75]);
xlabel('X [cm]','FontSize',19,'FontName','Times New Roman');
ylabel('Y [cm]','FontSize',19,'FontName','Times New Roman');
zlabel('Z [cm]','FontSize',19,'FontName','Times New Roman');
%ploting all the positions and elipsoids describing the distributions of
%the positions
title('scatter plot of the positions of the complete mixture model','FontSize',19,'FontName','Times New Roman');
for i=1:mixture.parms.N
    mu=mixture.parms.dists{i}.parms.dists{1}.parms.mu;
    sigma=diag(mixture.parms.dists{i}.parms.dists{1}.parms.sigma).^0.5;
    [x,y,z]=ellipsoid(mu(1),mu(2),mu(3),sigma(1),sigma(2),sigma(3));
    hold on;
    surf(x,y,z);
end
%scatter plot of the positions of the each component
for i=1:mixture.parms.N
    figure
    scatter3(pts(:,1),pts(:,2),pts(:,3),'MarkerFaceColor',[0 .75 .75]);
    mu=mixture.parms.dists{i}.parms.dists{1}.parms.mu;
    sigma=diag(mixture.parms.dists{i}.parms.dists{1}.parms.sigma).^0.5;
    [x,y,z]=ellipsoid(mu(1),mu(2),mu(3),sigma(1),sigma(2),sigma(3));
    hold on;
    surf(x,y,z);
    str=strcat('scatter plot of the positions of the',' ',int2str(i),' component');
    title(str,'FontSize',19,'FontName','Times New Roman');
    xlabel('X [cm]','FontSize',19,'FontName','Times New Roman');
    ylabel('Y [cm]','FontSize',19,'FontName','Times New Roman');
    zlabel('Z [cm]','FontSize',19,'FontName','Times New Roman');
end

%deciding what is direction of the wrist in the default orientation
if strcmp(obj,'sphere')
    tafs=[0 -1 0];
else
    tafs=[0 0 -1];
end
%o is the orientations of the gripper in moment of grasping
o=quatrotate(pts(:,4:7),tafs);

figure;
scatter3(o(:,1),o(:,2),o(:,3),'MarkerFaceColor',[0 .75 .75]);
title('the orientations of the mixture model','FontSize',19,'FontName','Times New Roman');
%showing the scatter plot of orientations of the mixture model
for i=1:mixture.parms.N
    hold on;
    if isa(mixture.parms.dists{i}.parms.dists{2},'vmf')
        vectarrow([0 0 0],quatrotate(mixture.parms.dists{i}.parms.dists{2}.parms.u',tafs),color(1+mod(i,size(color,2))));
    
    elseif isa(mixture.parms.dists{i}.parms.dists{2},'dimrothwatson1')
        vectarrow([0 0 0],quatrotate(mixture.parms.dists{i}.parms.dists{2}.parms.u',tafs),color(1+mod(i,size(color,2))));
        hold on
        vectarrow([0 0 0],-quatrotate(mixture.parms.dists{i}.parms.dists{2}.parms.u',tafs),color(1+mod(i,size(color,2))));
    else
        a=quatrotate(mixture.parms.dists{i}.parms.dists{2}.parms.u1',tafs);
        b=quatrotate(mixture.parms.dists{i}.parms.dists{2}.parms.u2',tafs);
        c=cross(a,b);
        plotCircle3D([0 0 0],c,1,color(1+mod(i,size(color,2))));
    end
end
xlabel('X [cm]','FontSize',19,'FontName','Times New Roman');
ylabel('Y [cm]','FontSize',19,'FontName','Times New Roman');
zlabel('Z [cm]','FontSize',19,'FontName','Times New Roman');

%showing the scatter plot of the orientations of each component in the mixture model
for i=1:mixture.parms.N

    figure;
    scatter3(o(:,1),o(:,2),o(:,3),'MarkerFaceColor',[0 .75 .75]);
    xlabel('X [cm]','FontSize',19,'FontName','Times New Roman');
    ylabel('Y [cm]','FontSize',19,'FontName','Times New Roman');
    zlabel('Z [cm]','FontSize',19,'FontName','Times New Roman');
    hold on;
    str=strcat('scatter plot of the orientations of the',' ',int2str(i),' component');
    title(str,'FontSize',19,'FontName','Times New Roman');
    if isa(mixture.parms.dists{i}.parms.dists{2},'vmf')
        vectarrow([0 0 0],quatrotate(mixture.parms.dists{i}.parms.dists{2}.parms.u',tafs),color(1+mod(i,size(color,2))));
    
    elseif isa(mixture.parms.dists{i}.parms.dists{2},'dimrothwatson1')
        vectarrow([0 0 0],quatrotate(mixture.parms.dists{i}.parms.dists{2}.parms.u',tafs),color(1+mod(i,size(color,2))));
        hold on
        vectarrow([0 0 0],-quatrotate(mixture.parms.dists{i}.parms.dists{2}.parms.u',tafs),color(1+mod(i,size(color,2))));
    else
        a=quatrotate(mixture.parms.dists{i}.parms.dists{2}.parms.u1',tafs);
        b=quatrotate(mixture.parms.dists{i}.parms.dists{2}.parms.u2',tafs);
        c=cross(a,b);
        plotCircle3D([0 0 0],c,1,color(1+mod(i,size(color,2))));
    end
    
end

%showing the distribution of the each component orientation
for i=1:mixture.parms.N
    figure;
    Plot3D(mixture.parms.dists{i}.parms.dists{2},obj);
    colormap bone
    str=strcat('distribution of the ',' ',int2str(i),' component');
    title(str,'FontSize',19,'FontName','Times New Roman');
end

end