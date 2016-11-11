function out = aic(dist, pts)

% Return the Akaike Information Criteria measure

loglik = sum(log(evaluate(dist,pts)));

out = -2 *loglik + 2 * nparms(dist) / (size(pts,2));
