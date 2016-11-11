function out = sample(gauss, N)

% Sample the Gaussian object

if(nargin < 2)
  N = 1;
end;

parms = gauss.parms;
ndim = parms.ndim;
out = mvnrnd(parms.mu,parms.sigma,N)';
%vals = randn(ndim,N);
%out = parms.A * vals + parms.mu' * ones(1, N);
