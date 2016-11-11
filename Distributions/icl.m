%--------------------------------------------------------------------------
% Function: icl(dist, pts)
%
% Evaluates the mixture model dists using the data points pts. The meausure
% used to evaluate the mixture model is the ICL criterion.
%
% param[in] dist: A mixture model.
% param[in] pts: An struct of 'length' and 'views' of the data.
% and N is the number of data points.
% param[out] icl: The icl value for the supplied mixture model.
%--------------------------------------------------------------------------

function out = icl(dist, pts)
	
    num_pts = length(pts);
	completed_loglik = completed_log_likelihood(dist, pts);
	out = -2 * completed_loglik + log(num_pts) * nparms(dist);
	out = real(out);

end
