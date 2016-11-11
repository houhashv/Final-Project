function Plot3D_position(mix)
    
    % set the sampling resolution
    n = 100;
    n2 = (n+1)^2;
    
    [X,Y,Z] = sphere(n); % create a unit sphere
    
    % convert X, Y, and Z into a row vector
    x = reshape(X,1,n2);
    y = reshape(Y,1,n2);
    z = reshape(Z,1,n2);    
    pts = [x;y;z];  
    
    % evaluate the values of the density function for each component
    values = normr(Get_probability(mix,pts,2)) .* 8; 
    
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
    
    % plot the result
    surf(X,Y,Z,values);    

end