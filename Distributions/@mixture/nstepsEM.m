function mix = nstepsEM(mix, N, pl_function, test_samples)

% Take <N> steps of EM on mixture <mix>
%	If <pl_function> is specified, it is called after each step

% TODO Just use named params or something?
do_plot = nargin >= 3 && isa(pl_function, 'function_handle');
record_steps = nargin >= 4 && ~isempty(test_samples);

% Record completed log likelihood for performance analysis.
if record_steps
	% Broken at start: completed_log_likelihood(mix, test_samples);
	% So just use 0 instead for now.
	mix.parms.steps.completed_log_likelihood(1, end+1) = 0;
end
for i = 1:N
	mix = stepEM(mix);
	if record_steps
		mix.parms.steps.completed_log_likelihood(i+1, end) = completed_log_likelihood(mix, test_samples);
	end
	if do_plot
		feval(pl_function, mix);
	end
end
