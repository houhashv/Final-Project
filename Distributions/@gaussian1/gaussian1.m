function self = gaussian1(varargin)
  switch nargin
  case 0
    % If no input arguments, create a default object.
    self = initgaussian('');
  case 1
    switch class(varargin{1})
    case 'char'
      % If text, it's the points_name for the new gaussian.
      % The points_name is used for extracting from composite data.
      self = initgaussian(varargin{1});
    case 'gaussian1'
      % If single argument of class asset, return it.
      self = varargin{1};
    otherwise
      error('Wrong argument type')
    end
  otherwise
    error('Wrong number of input arguments')
  end
end

function self = initgaussian(points_name)
  self.descriptor = 'gaussian distribution';
  self.parms.cov = {};
  self.parms.mu = [];
  self.parms.ndim = -1;
  self.optimized_points = [];
  self.points = [];
  self.points_name = points_name;
  self = class(self, 'gaussian1');  
end
