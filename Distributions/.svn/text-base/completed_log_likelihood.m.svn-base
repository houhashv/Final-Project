%--------------------------------------------------------------------------
% Function: icl(dist, pts)
%
% Evaluates the mixture model dists using the data points pts. The meausure
% used to evaluate the mixture model is the ICL criterion.
%
% param[in] dist: A mixture model.
% param[in] pts: An struct of 'length' and 'views' of the data.
% and N is the number of data points.
% param[out] icl: The icl value for the supplied mixture model.
%--------------------------------------------------------------------------

function out = completed_log_likelihood(dist, pts)
	% make sure that dist is a mixture model
	if ~isa(dist, 'mixture')
		error('icl: dist must be a mixture distribution');
	end

	z_hat = []; % initialize the z_hat matrix
	parms = get(dist, 'parms'); % get the parameters for the mixture model
	num_dists = parms.N; % get the number of elements in the mixture model
	num_pts = length(pts); % get the number of data points

	if num_dists == 1
		% If there is only one element in the mixture, every point must
		% belong to that element.
		z_hat = ones(1, num_pts);
	else
		% Since it is not assumed that pts was used to create dists, a new
		% prob matrix must be created for pts.
		prob = compute_prob(dist, pts);
		[C I] = max(prob);

		% The z_hat matrix describes whether a given data point belongs to
		% the ith element of the mixture. If the nth point belongs to the
		% ith element of the mixture, z_hat(i,n) = 1. Otherwise z_hat(i,n)
		% = 0.
		z_hat = zeros(num_dists, num_pts);

		for i = 1 : num_pts
			z_hat(I(i), i) = 1;
		end;
	end;

	phi = zeros(num_dists, num_pts);

	for i = 1 : num_dists
		phi(i, :) = parms.scale(i) * evaluate(parms.dists{i}, pts);
	end

	elems = find(phi == 0);
	phi(elems) = realmin;

	% Calculate the completed log likelihood.
	out = sum(sum(z_hat .* log(phi)));
end

function prob = compute_prob(m, pts)
	parms = get(m, 'parms');

	if parms.N == 1
		prob = ones(1, size(pts,2));
	else
		for i = 1:parms.N
			prob(i,:) = parms.scale(i) * evaluate(parms.dists{i}, pts);
		end

		prob = prob ./ ((ones(parms.N, 1)) * sum(prob));
	end
end

