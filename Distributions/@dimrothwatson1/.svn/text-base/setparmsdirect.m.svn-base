%--------------------------------------------------------------------------
% Function: setparmsdirect(dw1, u, k)
%
% Directly sets the parameters of the specified Dimroth-Watson distribution
% using the specified values for u and k.
%
% param[in] dw1: A Dimroth-Watson distribution object.
% param[in] u: The "mean" orientation.
% param[in] k: The concentration parameter.
% param[out] a: A new Dimroth-Watson distribution with the desired
% parameter values.
%--------------------------------------------------------------------------

function a = setparmsdirect(dw1, u, k ,r)

if(nargin < 3)
    error('dimrothwatson1.setparmsdirect(): Requires 3 parameters');
end;

if(~(isa(dw1,'dimrothwatson1')))
    error('dimrothwatson1.setparmsdirect(): Wrong object');
end;

a = dimrothwatson1(dw1);
parms = get(a,'parms');
parms.u = u;
parms.k = k;

% Set the parameters for this object
a = set(a,'parms',parms); 
