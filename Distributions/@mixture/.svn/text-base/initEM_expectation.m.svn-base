function mix = initEM_expectation(mix, pts)

% Initialize the mixture parameters by performing an E-step
%  (we assume that the individual distributions have been initialized to
%  something appropriate).

parms = mix.parms;
parms.data = pts;

parms.prob = [];
% Compute probability for each point and distribution
for i = 1:parms.N
  a = parms.dists{i};
  parms.prob(i,:) = evaluate(a, parms.data); 
end;

% Normalize
parms.prob = parms.prob ./ (ones(parms.N, 1) * sum(parms.prob));

% Scale
parms.scale = sum(parms.prob')/size(parms.data,2);

%%%%%% Store changes
mix = set(mix, 'parms', parms);



