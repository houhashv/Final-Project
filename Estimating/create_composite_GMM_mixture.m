%--------------------------------------------------------------------------
% Function: create_GMM_mixture(components)
%
% Creates a mixture model of composite distribution objects. Each composite
% has a position component (gaussian) and an orientation component 
% (gaussian). 
% param[in] components: The number of composites 
% param[out] m: A mixture model of composite distributions.
%--------------------------------------------------------------------------

function m = create_composite_GMM_mixture(components)
    % create a mixture model
    m = mixture;
    
    for i = 1:components
        c = comp;
        c = adddist(c,gaussian1);
        c = adddist(c,gaussian1);
        m = adddist(m,c);
    end
end