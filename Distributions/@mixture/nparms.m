function n = nparms(mix)

%  Return the number of parameters necessary to encode this distribution

if(~(isa(mix, 'mixture')))
  error('mixture.nparms(): wrong object');
end;
 
parms = mix.parms;

% Weighting across distributions
n = parms.N - 1;

% Parameters in each distribution
for i=1:parms.N
  n = n + nparms(parms.dists{i});
end;

