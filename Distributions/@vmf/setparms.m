%--------------------------------------------------------------------------
% Function: setparms(vmf, scale, pts)
%
% Updates the parameters of the specified vmf distribution using
% pts and scale. The scale argument is optional and is the probability that
% each point in pts belongs to dw1. pts may have an arbitrary number of
% rows as long as dw1.parms.u has the same number of rows (although the 
% vmf distribution is designed for quaternions). scale should 
% have the same number of columns as pts.
%
% param[in] self: A vmf distribution object.
% param[in] pts: An M x N matrix (data set).
% param[in] scale: A 1 x N vector (weights of each data point in pts).
% param[out] a: A new vmf distribution object with updated
% parameters.
%--------------------------------------------------------------------------

function a = setparms(self,scale,pts) 
    % if less than 2 arguments are supplied
    if nargin < 2
        error('vmf.setparms(): Requires 2 parameters');
    end

	if nargin < 3
		% Retrieve saved points.
		pts = optimized_points(self);
	else
		pts = optimized_points(self, pts);
	end

    [m,n] = size(pts); 
    a = vmf(self); 
    parms = get(a,'parms'); 
    
    % if pts does not have the same number of rows as dw1.parms.u
    if(m ~= size(parms.u,1))
        error(['vmf.setparms(): ', ...
            'pts must have the same number of rows as vmf1.parms.u']);    
        
    % if scale does not have the same number as columns as pts
    elseif(size(scale,2) ~= n) 
        error(['vmf.setparms(): ', ...
            'scale must have the same number of columns as pts']); 
        
    % if a small number of points belongs to this distribution return to
    % avoid numerical issues (k could be set to a very large value)
    elseif(sum(isnan(scale)) > 0 | mean(scale) < .01)
        return;
    end;     
       
    % update the parameters of vmf and return it
    wpts = pts .* (ones(size(pts,1),1) * scale);
    u = mle_of_u(wpts); 
    k = mle_of_k(wpts,scale);    
    
    parms.u = u;    
    parms.k = k;
    parms.ndim = m;
    a = set(a,'parms',parms); 
end

function u = mle_of_u(wpts)
%% MLE of the mean vector for vmf
    sumu  = sum(wpts');
    normu = sqrt(sumu*sumu');
    u   = sumu'./normu;

end

function k = mle_of_k(wpts,scale)
%% MLE of the concetration parameter k of vmf
    d=size(wpts,1);
    sumu  = sum(wpts');
    normu = sqrt(sumu*sumu');
    r_avg=normu/sum(scale);
    k=(r_avg*d-r_avg^3)/(1-r_avg^2);
    
end