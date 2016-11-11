function bing = setparms(bing, scale, pts)
% function setparms(bing, scale, pts)
%  <pts> = M x N matrix (N points)
%  <scale> = 1 x N vector
% Given a set of points, compute the ML parameters
%  for the Bingham Distribution

if(nargin < 2)
  error('bingham.setparms(): requires 2 parameters');
end;

if(nargin < 3)
  %scale = ones(1,size(pts,2));
  % Retrieve saved points.
end;

if(~(isa(bing, 'bingham')))
  error('bingham.setparms(): wrong object');
end;

bing = bingham(bing);

parms = get(bing, 'parms');
parms
%%% JUST MADE THIS UP...
cov = ((pts .* (ones(size(pts,1), 1) * scale)) * pts') ./ sum(scale);

[v,d] = eig(cov);
d = diag(d)+0.001;
d = -max(max(d))./d;
det(cov)
parms.cov = v * diag(d) * v';
parms.ndim = size(pts,1);
parms.scale = 1/(sqrt(det(cov))*((2 * pi).^(parms.ndim/2)));
parms.cov
bing = set(bing, 'parms', parms);

p = get(bing, 'parms');
p


