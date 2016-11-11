function pl(dist, arrange_points)

global plot_parms;

if nargin < 2
	arrange_points = @(points) points;
end

figure(3);
parms = get(dist, 'parms');

if(parms.ndim == 1)
	x = -1:0.01:3;
	vals = evaluate(dist, x');
	h = plot(x, vals);
	set(h, 'linewidth', 2);
	xlabel('x');
	ylabel('density');
	set(gca, 'fontsize', 14);
	drawnow;
	if false % plot_parms.print_flag
		strg = sprintf('density_%03d', plot_parms.print_count);
		plot_parms.print_count = plot_parms.print_count + 1;
		print('-depsc', strg);
	end;
	pause;
else
	x = 0:0.05:3;
	y = 0:0.05:3;

	xx = ones(size(y,2), 1) * x;
	yy = y' * ones(1, size(x,2));

	points = arrange_points([xx(:) yy(:)]');
	vals = evaluate(dist, points);
	vals = reshape(vals, size(xx,1), size(xx, 2));

	surf(xx, yy, vals);
	drawnow;
	if false % plot_parms.print_flag
		strg = sprintf('density_%03d', plot_parms.print_count);
		plot_parms.print_count = plot_parms.print_count + 1;
		print('-depsc', strg);
	end;
	pause;
end;
