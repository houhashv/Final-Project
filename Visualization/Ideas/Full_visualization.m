function[]=Full_visualization(pts,mix,object)


scatter3(pts(:,1),pts(:,2),pts(:,3),'MarkerFaceColor',[0 .75 .75])
title('Scater plot of the positions','FontSize',19,'FontName','Times New Roman');

for i=1:mix.parms.N
    figure;
    Plot3D(mix.parms.dists{i}.parms.dists{1});
    title(strcat(object,'-gauss of component # ',num2str(i)),'FontSize',19,'FontName','Times New Roman');
    xlabel('X','FontSize',19,'FontName','Times New Roman');
    ylabel('Y','FontSize',19,'FontName','Times New Roman');
    zlabel('Z','FontSize',19,'FontName','Times New Roman');
    
end

figure;
orientation=normr(pts(:,5:7));
scatter3(orientation(:,1)*10,orientation(:,2)*10,orientation(:,3)*10,'MarkerFaceColor',[0 .75 .75])
title('Scater plot of the normalized quaternion''s rotation vectores','FontSize',19,'FontName','Times New Roman');

for i=1:mix.parms.N
    figure;
    Plot3D(mix.parms.dists{i}.parms.dists{2});
    title(strcat(object,'-cyclic of component # ',num2str(i)),'FontSize',19,'FontName','Times New Roman');
    xlabel('X','FontSize',19,'FontName','Times New Roman');
    ylabel('Y','FontSize',19,'FontName','Times New Roman');
    zlabel('Z','FontSize',19,'FontName','Times New Roman');

end

end

function[]=Draw(object)

switch object
    case 'sphere'
        Draw_sphere;
    case 'pan'
        Draw_pan;
    case 'cup'
        Draw_Cup;
end

end