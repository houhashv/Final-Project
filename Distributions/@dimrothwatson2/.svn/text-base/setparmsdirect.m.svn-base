%--------------------------------------------------------------------------
% Function: setparmsdirect(dw2, u1, u2, k)
%
% Directly sets the parameters of the specified girdle distribution using 
% the specified values for u1, u2, and k.
%
% param[in] dw2: A girdle distribution object.
% param[in] u1: The first vector that spans a great circle on the unit
% quaternion hypershpere.
% param[in] u2. The second vector that spans a great circle on the unit
% quaternion hypershpere.
% param[in] k: The concentration parameter.
% param[out] a: A new girdle distribution with the desired parameter 
% values.
%--------------------------------------------------------------------------

function a = setparmsdirect(dw2, u1, u2, k)

if(nargin < 4)
    error('dimrothwatson2.setparmsdirect(): Requires 3 parameters');
end;

if(~(isa(dw2,'dimrothwatson2')))
    error('dimrothwatson2.setparmsdirect(): Wrong object');
end;

a = dimrothwatson2(dw2);
parms = get(a,'parms');
parms.u1 = u1;
parms.u2 = u2;
parms.k = k;

% Set the parameters for this object
a = set(a,'parms',parms);