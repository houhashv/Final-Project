%--------------------------------------------------------------------------
% Function: nparms(dw1)
%
% Returns the number of parameters required for the specified
% Dimroth-Watson distribution object.
%
% param[in] dw1: A Dimroth-Watson distribution object.
% param[out] n: The number of parameters required for dw1.
%--------------------------------------------------------------------------

function n = nparms(dw1)

% if dw1 is not of type dimrothwatson1
if(~(isa(dw1, 'dimrothwatson1')))
  error('dimrothwatson1.nparms(): wrong object');
end;

% 3 components of u and k are the parameters for this model (4 total)
n = 4;