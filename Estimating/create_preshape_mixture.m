%--------------------------------------------------------------------------
% Function: create_preshape_mixture(dw1, dw2, vmf1)
%
% Creates a mixture model of composite distribution objects. Each composite
% has a position component (gaussian) and an orientation component 
% (Dimroth-Watson, girdle or vmf). The sum of dw1, dw2 and vmf1 determines the number 
% of composites in the mixture model, where dw1 denotes the number of 
% composites that contain a Dimroth-Watson distribution, dw2 
% denotes the number of composites that contain a girdle distribution.
% and vmf1 denotes the number of composites that contain a vmf
% distribution.
%
% param[in] dw1: The number of composites that contain a Dimroth-Watson 
% distribution.
% param[in] dw2: The number of composites that contain a girdle
% distribution.
% param[in] vmf1: The number of composites that contain a vmf
% distribution.
% param[out] m: A mixture model of composite distributions.
%--------------------------------------------------------------------------

function m = create_preshape_mixture(dw1, dw2, vmf1)
    % create a mixture model
    m = mixture;
    
    for i = 1:dw1
        c = comp;
        c = adddist(c,gaussian1);
        c = adddist(c,dimrothwatson1);
        m = adddist(m,c);
    end

    for j = 1:dw2
        c = comp;
        c = adddist(c,gaussian1);
        c = adddist(c,dimrothwatson2);
        m = adddist(m,c);
    end
   
    for k = 1:vmf1
        c = comp;
        c = adddist(c,gaussian1);
        c = adddist(c,vmf);
        m = adddist(m,c);
    end
end