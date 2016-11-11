%Fits two dimroth-watson1 distributions to a single data set

function m2 = two_dists_dw1(dataSet)
%dataSet = blockTwoSides;

% Create 2 dimrothwatson1 distributions
dw1a = dimrothwatson1;
dw1b = dimrothwatson1;
dw1c = dimrothwatson1;
dw1d = dimrothwatson1;
dw1e = dimrothwatson1;
dw1f = dimrothwatson1;

% Create mixture distribution
m = mixture;
m = adddist(m, dw1a);
m = adddist(m, dw1b);
m = adddist(m, dw1c);
m = adddist(m, dw1d);
m = adddist(m, dw1e);
m = adddist(m, dw1f);
% both dimrothwatson1 distributions will have equal weight by default.



m2 = initEM(m, dataSet);
input('Hit RETURN to continue\n');

m2 = nstepsEM(m2, 20);

