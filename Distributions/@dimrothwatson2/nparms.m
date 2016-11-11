%--------------------------------------------------------------------------
% Function: nparms(dw2)
%
% Returns the number of parameters required for the specified girdle 
% distribution object.
%
% param[in] dw2: A girdle distribution object.
% param[out] n: The number of parameters required for dw2.
%--------------------------------------------------------------------------

function n = nparms(dw2)

% if dw2 is not of type dimrothwatson2
if(~(isa(dw2, 'dimrothwatson2')))
  error('dimrothwatson2.nparms(): wrong object');
end;

% 3 components of u1, two components of u2, and k are the parameters
% for this model (6 total)
n = 6;