%--------------------------------------------------------------------------
% Function: create_position_mixture(nelems)
%
% Creates a nelems element mixture model of 3D guassian distributions.
%
% param[in] nelems: The number of elements in the mixture model.
% param[out] m: A mixture model of position (3D gaussian) distributions.
%--------------------------------------------------------------------------

function m = create_position_mixture(nelems,ndim)
    % create a mixture model
    %the data dimention is ndim
    m = mixture;
    
    % create a 3D gaussian
    g = gaussian1('position');
    gparms = get(g,'parms');
    gparms.ndim = ndim;
    g = set(g,'parms',gparms);

    % add nelems gaussians to the mixture
    for i = 1:nelems
        m = adddist(m,g);
    end
end
