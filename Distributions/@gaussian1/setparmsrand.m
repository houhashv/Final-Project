function gauss = setparmsrand(gauss, pts)
% function setparmsrand(gauss, pts)
%  <pts> = M x N matrix (N points)
% Given a points of a specific dim, set the parms of the 
%  the Gaussian Distribution

if(nargin < 2)
  error('gaussian.setparmsrand(): requires 2 parameters');
end;
if(~(isa(gauss, 'gaussian1')))
  error('gaussian.setparms(): wrong object');
end;

parms = gauss.parms;

wpts = pts .* (ones(size(pts,1),1) * scale);

mu = sum(wpts') ./ sum(scale);
p2 = (wpts - (mu' * ones(1,size(pts,2))));

cov = p2 * p2' ./ sum(scale);
[v,d] = eig(cov);

parms.mu = mu;
parms.cov = inv(cov);
parms.scale = 1/(((2 * pi).^(size(pts,1)/2))*sqrt(det(cov)));
parms.ndim = size(pts,1);
parms.A = v * sqrt(d);

gauss = set(gauss, 'parms', parms);

p = get(gauss, 'parms');



