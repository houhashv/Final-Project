function mix = adddist(mix, dist)

% Add a new distribution to the current mixture distribution

mix = mixture(mix);

parms = mix.parms;
dparms = get(dist,'parms');

if(parms.N > 0 & (dparms.ndim ~= parms.ndim))
  error(['mixture::addist(): Number of input dimensions does not match other' ...
	 ' distributions']);
  
end;

if(parms.N == 0)
  parms.ndim = dparms.ndim;
end;

parms.N = parms.N + 1;
parms.scale = ones(1,parms.N)/parms.N;
parms.dists{parms.N} = dist;

mix = set(mix, 'parms', parms);
