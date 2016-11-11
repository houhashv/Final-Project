function out = bic(dist, pts)

% Return the Bayesian Information Criteria measure

loglik = sum(log(evaluate(dist,pts)));
out = -2 *loglik + log(size(pts,2)) * nparms(dist);
