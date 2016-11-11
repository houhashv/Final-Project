function Plot_quats(quaternions)

    % set the sampling resolution
    n = size(quaternions,1);
    n2 = (n+1)^2;
    
    % convert X, Y, and Z into a row vector
    x = reshape(quaternions(:,2),1,n2);
    y = reshape(quaternions(:,3),1,n2);
    z = reshape(quaternions(:,4),1,n2);     
    values = sin(acos(quaternions(:,2))); 
    
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
    surf(X,Y,Z,values); 
    xlabel('X');
    ylabel('Y');
    zlabel('Z'); 
end