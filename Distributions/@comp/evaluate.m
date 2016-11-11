%--------------------------------------------------------------------------
% Function: evaluate(c, qs)
%
% Evaluates the supplied composite distribution using the query points
% qs. qs should be a M x N matrix where M is the dimensionality of each
% query point, and N is the number of query points. qs must have
% c.parms.ndim rows.
%
% param[in] self: A composite distribution object.
% param[in] qs: An struct of views of the data points.
% param[out] densities: A 1 x N vector of densities (one for each column of
% qs).
%--------------------------------------------------------------------------

function densities = evaluate(self, pts)

% make sure self is the right type of object
if ~isa(self, 'comp')
	error('composite.evaluate(): Wrong object type');
end

if nargin < 2
	% Get prestored points.
	pts = optimized_points(self);
else
	pts = optimized_points(self, pts);
end

[m n] = size(pts);
cparms = get(self, 'parms');

% TODO No more meaning here with abstract points.
% if qs does not have self.parms.ndim rows
%if(m ~= cparms.ndim)
%	error('composite.evaluate(): qs must have c.parms.ndim rows');
%end;

% keep track of the density
density = ones(1, n);

% compute the density for each component of the composite and multiply
% them together
for i = 1 : cparms.N
	dist = cparms.dists{i}; % get the ith dist of the composite
	dparms = get(dist, 'parms'); % get the parameters of dist
	
    if strcmp(class(dist),'gaussian1') && i==1
        density = density .* evaluate(dist, pts(1:3,:));
    else
        %%the special case where the composite is of 2 gaussians
        if strcmp(class(dist),'gaussian1') && i==2
            density = density .* evaluate(dist, pts(4:6,:));
        end
    end
    

    if strcmp(class(dist),'dimrothwatson1') || strcmp(class(dist),'dimrothwatson2') || strcmp(class(dist),'vmf')
        density = density .* evaluate(dist, pts(4:7,:));
    end
end

densities = density;
