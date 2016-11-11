function out = evaluate(self, points)

if ~isa(self, 'gaussian1')
	% Is this really a common issue?
	error('gaussian.evaluate(): wrong object');
end;

%disp('evaluate')
%size(points)
%class(points)

% TODO How to avoid the multipart 'if'?
% My problem is with 'points' being undefined for a single call.
% Could use 'varargin' perhaps, but that has also seemed sloppy.
if nargin < 2
	points = optimized_points(self);
else
	points = optimized_points(self, points);
end

parms = get(self, 'parms');

if isempty(parms.mu)
	% if the parameters have not been set just return 0's
	out = zeros(1, size(points, 2));
elseif length(parms.mu) == 1
	% 1 DOF
	points = (points - parms.mu * ones(1, size(points, 2)));
	tmp = points .* (parms.sigma_inverse * points);
	out = parms.scale .* exp(-0.5 * tmp);  
else
	% N DOF
	points = (points - parms.mu' * ones(1, size(points, 2)));
	tmp = points .* (parms.sigma_inverse * points);
	out = parms.scale .* exp(-0.5 * sum(tmp));
end;

