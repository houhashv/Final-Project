%--------------------------------------------------------------------------
% Function: dimrothwatson2(varargin)
%
% Creates a girdle distribution object. If no arguments are supplied a
% default girdle distribution is created. If a single argument is supplied
% and it is of type dimrothwatson2 it is returned.
%
% A girdle distribution has 3 parameters: u1, u2, and k. u1 and u2 are
% orthogonal unit quaternions that span a great circle on the surface of
% the unit quaternion hypershpere. k is a concentration parameter. A high
% value of k corresponds to high concentration about the great circle
% spanned by u1 and u2.
%
% param[in] (optional) varargin: A girdle distribution object.
% param[out] a: A new girdle distribution object.
%--------------------------------------------------------------------------

function self = dimrothwatson2(varargin)
	switch nargin % the number of input arguments
	    case 0
	        % if no input arguments, create a default object
	        self = init_dimrothwatson2('');
	    case 1
			switch class(varargin{1})
			case 'char'
				% If text, it's the points_name for the new gaussian.
				% The points_name is used for extracting from composite data.
				self = init_dimrothwatson2(varargin{1});
			case 'dimrothwatson2'
				% If single argument of class asset, return it.
				self = varargin{1};
			otherwise
				error('Wrong argument type')
			end
	    otherwise
	        error('dimrothwatson2.dimrothwatson2(): Wrong number of input arguments')
	end
end

function self = init_dimrothwatson2(points_name)
    self.descriptor = 'girdle distribution';
	self.optimized_points = [];
    self.parms.u1 = zeros(4,1);
    self.parms.u2 = zeros(4,1);
    self.parms.k = 0;
    self.parms.ndim = -1;
	self.points = [];
    self.points_name = points_name;
    self = class(self, 'dimrothwatson2');
end
