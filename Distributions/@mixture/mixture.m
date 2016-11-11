function self = mixture(varargin)

switch nargin
	case 0
		% if no input arguments, create a default object
		a.descriptor = 'mixture distribution';
		a.parms.N = 0;
		a.parms.steps.completed_log_likelihood = []; % History of steps: ICL minus nparms term, for rating performance.
		a.parms.scale = {}; % Probability of each sub-dist
		a.parms.dists = {}; % Set of distributions
		a.parms.prob = [];  % Probability that a training point is assigned to a particular dist
		a.parms.ndim = -1;  % Number of dimensions over this pdf
		a.points = [];
		self = class(a, 'mixture');
	case 1
		% if single argument of class asset, return it
		if isa(varargin{1}, 'mixture')
			self = varargin{1};
		else
			error('Wrong argument type')
		end 
	otherwise
		error('Wrong number of input arguments')
end
