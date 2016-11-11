function dist_number = max_dist(self, points)
  % Returns the number (1xsize(points,2)) of each distribution
  % that is the best fit for each point.

  if nargin < 2
    % Retrieve saved points.
    points = optimized_points(self);
  else
    points = optimized_points(self, points);
  end

  % Taken from display_position_mixture, but it could also apply to completed_log_likelihood.
  parms = self.parms;
  prob = zeros(parms.N, size(points, 2));
  for i = 1:parms.N
    prob(i, :) = parms.scale(i) * evaluate(parms.dists{i}, points);
  end
  [vals, dist_number] = max(prob);

end
