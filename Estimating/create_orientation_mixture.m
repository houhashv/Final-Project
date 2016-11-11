%--------------------------------------------------------------------------
% Function: create_orientation_mixture(dw1, dw2, vmf1)
%
% Creates a mixture model of Dimroth-Watson and girdle distribution objects. 
% The sum of dw1 and dw2 determines the number of elements in the mixture 
% model, where dw1 denotes the number of Dimroth-Watson distributions in 
% the mixture and dw2 denotes the number girdle distributions in the
% mixture.
%
% param[in] dw1: The number of Dimroth-Watson distributions in the mixture.
% param[in] dw2: The number of girdle distributions in the mixture.
% param[out] m: A mixture model of orientation distributions.
%--------------------------------------------------------------------------

function m = create_orientation_mixture(dw1, dw2, vmf1)
    % create a mixture model
    m = mixture;

    % add dw1 Dimroth-Watson distributions to the mixture
    for i = 1:dw1       
        m = adddist(m,dimrothwatson1('orientation'));
    end
    
    % add dw2 girdle distributions to the mixture
    for j = 1:dw2
        m = adddist(m,dimrothwatson2('orientation'));
    end
    
    % add vmf1 distributions to the mixture
    for j = 1:vmf1
        m = adddist(m,vmf('orientation'));
    end
end
