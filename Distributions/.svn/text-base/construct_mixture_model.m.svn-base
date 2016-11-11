function m2 = construct_mixture_model(N, D, Nsteps, pl_function)

% Construct and train a mixture model.
%  <N> = the number of Gaussians
%  <D> = the training data
%  <Nsteps> = the number of EM steps to perform
%  [<pl_function>] = a function for plotting the current state of the 
%          model
%


flag = 1;
if(nargin < 4)
  flag = 0;
end;

% Return a mixture distribution that fits data D with N gaussians

% Create N gaussian distributions
g = {};

for i = 1:N
  % New gaussian
  g{i} = gaussian;
  % Force the setting of the parameters
  g{i} = setparms(g{i}, ones(1, size(D, 2)), D);
end;

% Create mixture distribution
m = mixture;

for i=1:N
  m = adddist(m, g{i});
end;


if(N == 1)
  m2 = m;
  return;
end;

% Initialize the mixture
m2 = initEM(m, D);

% Now train the mixture
if(flag)
  m2 = nstepsEM(m2, Nsteps, pl_function);
else
  m2 = nstepsEM(m2, Nsteps);
end;
