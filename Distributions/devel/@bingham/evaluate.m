function out = evaluate(bing, pts)

if(~(isa(bing, 'bingham')))
  error('bingham.evaluate(): wrong object');
end;

parms = get(bing, 'parms');

out = parms.scale .* exp(sum(pts' * parms.cov * pts));
