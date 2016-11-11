function a = set(a,prop_name, val)
% GET Get asset properties from the specified object
% and return the value
a = mixture(a);
switch prop_name
case 'parms'
	a.parms = val;
case 'descriptor'
	error('Not allowed to change the desriptor');
otherwise
	error([prop_name,' Is not a valid asset property'])
end
