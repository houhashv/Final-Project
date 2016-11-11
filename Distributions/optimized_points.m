%
% TODO Rename from 'points' to 'samples'?
%
function optimized = optimized_points(distribution, points, override)

%disp(sprintf('optimized points for %s (%s) with %d', distribution.points_name, class(distribution), nargin));
%class(points)
%size(points)

if nargin == 2

	optimized = optimize_points(distribution, points);
else
	% Just use the prestored optimized point representation.
	% TODO Is there any value in this?
	% I'd hoped for that "override" thing to be useful to avoid nargin checks externally,
	% but I haven't found a way to make it work yet.
	optimized = distribution.optimized_points;
end
