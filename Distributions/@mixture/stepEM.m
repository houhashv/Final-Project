function self = stepEM(self)

% Take one step of EM

parms = self.parms;
points = optimized_points(self);
npoints = size(points, 2);

%% E-Step
%%%%%%%%%% Compute new probs p(h|x,parameters}

for i = 1:parms.N
  parms.prob(i, :) = parms.scale(i) * evaluate(parms.dists{i});
end;

% set parms.prob and parms.scale
if parms.N == 1
  parms.prob = ones(1, npoints);
else
  parms.prob = parms.prob ./ ((ones(parms.N, 1)) * sum(parms.prob));
end;

if parms.N == 1
  parms.scale = 1;
else
  parms.scale = sum(parms.prob') / npoints;
end;

%%M-Step
%%%%%%%%%% Compute MLE of mixture weights and parameters
for i = 1:parms.N
      % The points should have been saved within each dist during 'initEM'.
        parms.dists{i} = setparms(parms.dists{i}, parms.prob(i,:),points);
end;

%%%%%% Store changes
self = set(self, 'parms', parms);
