%
% pts - An M by N array of N points of dimension M,
%       or a struct array with a field representing this.
%
function self = initEM(self, pts)

% Initialize the mixture parameters in preparation for applying EM

parms = self.parms;
self.points = pts;

% Scale to normal
parms.scale = ones(1, parms.N) / parms.N;

%%%%%%%%%% randomly Compute MLE of mixture parameters

% Randomly assign points to dists
parms.prob = zeros(parms.N, size(pts, 2));

for i = 1 : size(pts, 2)
    parms.prob(floor(rand * parms.N) + 1, i) = 1;
end;

for i = 1:parms.N
        parms.dists{i} = setparms(parms.dists{i}, parms.prob(i,:),pts);
end;

% Store the points in advance for each distribution.
% Allows optimization if needed before the algorithm starts.
for i = 1 : parms.N
	parms.dists{i}.points = pts;
end;

self = set(self, 'parms', parms);
