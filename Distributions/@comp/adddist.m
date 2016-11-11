%--------------------------------------------------------------------------
% Function: adddist(c, dist, n)
% 
% Adds the n-dimensional distribution dist to the composite distribution c.
%
% param[in] c: A composite distribution object.
% param[in] dist: A distribution object.
% param[in] n: The dimensionality of dist.
% param[out] a: A new composite distribution object with dist added.
%--------------------------------------------------------------------------

function a = adddist(self, dist)

% TODO Why this call??? Just to validate???
a = comp(self);

cparms = a.parms;

cparms.N = cparms.N + 1;
cparms.dists{cparms.N} = dist;
a = set(a, 'parms', cparms);
