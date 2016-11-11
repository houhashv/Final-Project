%--------------------------------------------------------------------------
% Function: resumeEM(m, pts)
%
% Returns a new mixture model with a recomputed prob and data matrix based
% on pts. This allows you to continue the EM algorithm using the same
% parameters as <m>, but with the new data set <pts>.
%--------------------------------------------------------------------------

function new_m = resumeEM(m, pts)
    prob = [];
    parms = get(m,'parms');
    
    if(parms.N == 1)
        prob = ones(1,size(pts,2));        
    else        
        for i = 1:parms.N 
            prob(i,:) = parms.scale(i) * evaluate(parms.dists{i},pts);    
        end
        
        prob = prob ./ ((ones(parms.N,1)) * sum(prob));        
    end
    
    parms.prob = prob;
    parms.data = pts;
    
    new_m = set(m,'parms',parms);
end