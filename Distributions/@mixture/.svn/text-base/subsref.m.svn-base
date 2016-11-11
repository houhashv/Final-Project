%SUBSREF Reference methods on a MIXTURE object
%

function val = subsref(self, index)

if index(1).type == '.'
	switch index(1).subs
	case 'optimized_points'
		% No special handling of "optimized" points for mixture.
		val = self.points;
	case 'parms'
		val = self.parms;
	case 'points_name'
		val = '';
	case 'points'
		val = self.points;
	otherwise
		error(['Invalid field name: ' index(1).subs]);
	end
	if length(index) > 1
		val = subsref(val, index(2:end));
	end
else
	error('only .field supported')
end
