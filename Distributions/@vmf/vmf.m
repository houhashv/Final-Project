%--------------------------------------------------------------------------
% Function: vmf(varargin)
%
% Creates a vmf distribution object. If no arguments are
% supplied a default Dimroth-Watson distribution is created. If a single
% argument is supplied and it is of type vmf it is returned.
%
% A vmf distribution has two parameters: u and k. u is a unit
% quaternion (4 element column vector) that represents the "mean"
% orientation. k is a concentration parameter. A higher value of k
% corresponds to more concentration about u.
%
% param[in] (optional) varargin: A vmf distribution object.
% param[out] a: A new Dimroth-Watson distribution object.
%--------------------------------------------------------------------------
%created by: yossi hohashvili inspired by Dr. andrew H.fagg and Mr. Charles
%Degranvile
%email: yossihohashvili1@gmail.com
%january 2016

function self = vmf(varargin)
  switch nargin % the number of input arguments
    case 0
      % if no input arguments, create a default object
      self = init_vmf('');
    case 1
      switch class(varargin{1})
      case 'char'
        % If text, it's the points_name for the new gaussian.
        % The points_name is used for extracting from composite data.
        self = init_vmf(varargin{1});
      case 'vmf'
        % If single argument of class asset, return it.
        self = varargin{1};
      otherwise
        error('Wrong argument type')
      end
    otherwise
      error('vmf.vmf(): Wrong number of input arguments')
  end
end

function self = init_vmf(points_name)
  self.descriptor = 'vmf distribution';
  self.optimized_points = [];
  self.parms.u = zeros(4,1);
  self.parms.k = 0;
  self.parms.ndim = -1;
  self.points = [];
  self.points_name = points_name;
  self = class(self, 'vmf');
end
