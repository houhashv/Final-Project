%--------------------------------------------------------------------------
% Function: nparms(vmf)
%
% Returns the number of parameters required for the specified
% vmf object.
%
% param[in] dw1: A vmf distribution object.
% param[out] n: The number of parameters required for vmf.
%--------------------------------------------------------------------------

function n = nparms(vmf)

% if vmf is not of type vmf
if(~(isa(vmf, 'vmf')))
  error('vmf.nparms(): wrong object');
end;

% 3 components of u and k are the parameters for this model (4 total)
n = 4;