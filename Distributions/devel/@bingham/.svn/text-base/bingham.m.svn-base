function a = bingham(varargin)

switch nargin
 case 0
  % if no input arguments, create a default object
  a.descriptor = 'bingham distribution';
  a.parms.cov = diag(-ones(1,4));
  a.parms.scale = 0;
  a = class(a,'bingham');  
 case 1
  % if single argument of class asset, return it
  if (isa(varargin{1},'bingham'))
    a = varargin{1};
  else
    error('Wrong argument type')
  end 
 otherwise
  error('Wrong number of input arguments')
end