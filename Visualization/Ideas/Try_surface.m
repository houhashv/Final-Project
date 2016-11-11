function[]=Try_surface(a,p) 
    [theta,phi,r]=cart2sph(a(:,1),a(:,2),a(:,3));
    x= theta;
    y=phi;
    z=p;
    surface_on(x,y,z);
    [x,y,z]=Organize_surface(a,p);
    figure();
    surface_on(x,y,z)
    
    
    
end

function[]=surface_on(x,y,z)
    dx=0.05;
    dy=0.05;
    x_edge=[floor(min(x)):dx:ceil(max(x))];
    y_edge=[floor(min(y)):dy:ceil(max(y))];
    [X,Y]=meshgrid(x_edge,y_edge);
    Z=griddata(x,y,z,X,Y);
    surf(X,Y,Z);
end