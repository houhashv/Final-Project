% Example of using mixture distributions with 2 DOF


% Create 2 gaussian distributions
g1 = gaussian;
g2 = gaussian;

% Set the parameters of the gaussians by presenting a few sample points.

g1 = setparms(g1, ones(1, 3), [1.2 2.1; 1.8 2.4; 1.6 2.0]');

g2 = setparms(g2, ones(1, 3), [1.2 1.2; 1.3 0.8; 1.1 0.5]');

% Take some samples from each distribution.

d1 = sample(g1, 50);
d2 = sample(g2, 50);

figure(1)
plot(d1(1,:), d1(2,:), 'r.');
hold on
plot(d2(1,:), d2(2,:), 'b.');

input('Hit RETURN to continue\n');
disp('Gaussian 1');
pl(g1);
%irotation;

disp('Hit RETURN to continue\n');

disp('Gaussian 2');
pl(g2);

disp('Hit RETURN to continue\n');

for take = 1:2
	% Create mixture distribution
	m = mixture;
	if take == 1
		disp('Take 1: Raw points.');
		g1.points_name = '';
		g2.points_name = '';
	else
		disp('Take 2: Structured points.');
		g1.points_name = 'location';
		g2.points_name = 'location';
	end
	m = adddist(m, g1);
	m = adddist(m, g2);
	% By default the two gaussians will have equal weight.

	% Note that matlab is always pass by reference (ie no side effects allowed)

	d = sample(m, 100);
	if take == 1
		% Take 1: Use raw points.
		arrange_points = @(points) points;
	else
		% Take 2: Use structured points.
		arrange_points = @(points) ...
			arrayfun(@(i) struct('location', points(:,i)), 1:size(points,2));
	end
	points = arrange_points(d);

	figure(1);
	plot(d(1,:), d(2,:), 'g.');
	hold off;

	pl(m, arrange_points);
	disp('Combined distribution');

	% Set up the mixture distribution for training.  This randomly
	%  assigns points to halves of the distribution.  Note also that
	%  Although m2 is essentially a copy of m, the parameters of the
	%  distributions will be wiped out by the first step of the EM
	%  process

	m2 = initEM(m, points);
	input('Hit RETURN to continue\n');

	m2 = nstepsEM(m2, 8, @(dist, arrange) pl(dist, arrange_points));
end
