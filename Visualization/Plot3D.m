function Plot3D(dist,object)
    %this function plots the distribution of the orientations in 3D
    
    % set the sampling resolution
    n = 100;
    n2 = (n+1)^2;
    
    [X,Y,Z] = sphere(n); % create a unit sphere
    
    % convert X, Y, and Z into a row vector
    x = reshape(X,1,n2);
    y = reshape(Y,1,n2);
    z = reshape(Z,1,n2);    
    pts = [x;y;z];  
    
    dist = which_dist(dist,object);

    % evaluate the values of the density function for each point
    values = normr(evaluate(dist,pts)) .* 8; 
    
    % scale each point by the density at that point, and add to the
    % original value 
    x = x + (x .* values);
    y = y + (y .* values);
    z = z + (z .* values);
    
    % convert each x, y, z, and values to a matrix
    X = reshape(x,n+1,n+1);
    Y = reshape(y,n+1,n+1);
    Z = reshape(z,n+1,n+1);    
    values = reshape(values,n+1,n+1);    
    
   %% C = del2(values);
    surf(X,Y,Z,values); 
    xlabel('X','FontSize',19,'FontName','Times New Roman');
    ylabel('Y','FontSize',19,'FontName','Times New Roman');
    zlabel('Z','FontSize',19,'FontName','Times New Roman');
end


function[dist]=which_dist(dist,object)

    if strcmp(object,'sphere')
        a=[0 -1 0];
    else
        a=[0 0 -1];
    end

    if isa(dist, 'dimrothwatson1') || isa(dist, 'vmf')
        vector=quatrotate(dist.parms.u',a); 
        dist=setparmsdirect(dist,vector',dist.parms.k);
    elseif isa(dist, 'dimrothwatson2')
        vector1=quatrotate(dist.parms.u1',a);
        vector2=quatrotate(dist.parms.u2',a);
        a1=Normalize_matrix(vector1-vector2);
        a2=Normalize_matrix(vector1+vector2);
        dist=setparmsdirect(dist,a1,a2,dist.parms.k);    
    end;
    
    if isa(dist, 'gaussian1')
        dist=setparmsdirect(dist,normr(dist.parms.mu),dist.parms.sigma);
    end
        
end
