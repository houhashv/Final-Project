%--------------------------------------------------------------------------
% Function: evaluate(self, qs)
%
% Evaluates the supplied vmf distribution using the query points 
% qs. qs should be a M x N matrix where M is the dimensionality of each 
% query point, and N is the number of query points. The u parameter of self
% should have the same number of rows as qs.
%
% param[in] self: A vmf distribution object.
% param[in] qs: An M x N matrix of query points.
% param[out] densities: A 1 x N vector of densities (one for each column of
% qs).
%--------------------------------------------------------------------------

function densities = evaluate(self, qs)
    % if self is not of the correct type
    if ~isa(self, 'vmf')
        error('vmf.evaluate(): Wrong object');
    end;

	if nargin < 2
		% Get prestored points.
		qs = optimized_points(self);
	else
		qs = optimized_points(self, qs);
	end

    m = size(qs,1);
    parms = get(self, 'parms');

    % if qs does not have the same number of rows as self.parms.u
    if(m ~= size(parms.u,1))
        error(['vmf.evaluate(): ', ...
            'qs must have the same number or rows as vmf.parms.u']);
    end;

    u = parms.u;
    k = parms.k;  
    densities = Cp_k(size(u,1),k)* exp(k * (qs' * u) )';
    %%

    %%
end

function Cp_k=Cp_k(nu,k)
%%calculating the normalization parameter
    Cp_k=k^(nu/2-1)/((2*pi)^(nu/2)*besselj(nu/2-1,k));
    if Cp_k<0
        Cp_k=1;
    end
     
end
