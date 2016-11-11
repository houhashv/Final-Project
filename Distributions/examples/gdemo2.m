%
%  Example of using mixture distributions in the 1 DOF case
% 

% Create 2 gaussian distributions
g1 = gaussian;
g2 = gaussian;

% Set the parameters of the gaussians by presenting a few sample points.

g1 = setparms(g1, ones(1, 3), [1.2 2.4 2.0]);

g2 = setparms(g2, ones(1, 3), [0 0.2 0.3]);

% Take some samples from each distribution.

d1 = sample(g1, 50);
d2 = sample(g2, 50);

flag = (size(d1,1) == 1);  % 1 DOF
figure(1)
if(flag)
  plot(d1(1,:), ones(size(d1,1)), 'r.');
  hold on
  plot(d2(1,:), ones(size(d1,1)), 'b.');
else
  plot(d1(1,:), d1(2,:), 'r.');
  hold on
  plot(d2(1,:), d2(2,:), 'b.');
end;
hold off;

input('Hit RETURN to continue\n');
disp('Gaussian 1');
pl(g1);
if(~flag)
  irotation;
end;

input('Hit RETURN to continue\n');

disp('Gaussian 2');
pl(g2);

input('Hit RETURN to continue\n');

% Create mixture distribution
m = mixture;
m = adddist(m, g1);
m = adddist(m, g2);
% By default the two gaussians will have equal weight.

% Note that matlab is always pass by reference (ie no side effects allowed)

d = sample(m, 100);

figure(1)
if(size(d,1) == 1)
  plot(d(1,:), ones(length(d),1), 'g.');
else
  plot(d(1,:), d(2,:), 'g.');
end;

hold off;

pl(m);
disp('Combined distribution');

% Set up the mixture distribution for training.  This randomly
%  assigns points to halves of the distribution.  Note also that
%  Although m2 is essentially a copy of m, the parameters of the
%  distributions will be wiped out by the first step of the EM
%  process

m2 = initEM(m, d);
input('Hit RETURN to continue\n');

m2 = nstepsEM(m2, 10, @pl);
