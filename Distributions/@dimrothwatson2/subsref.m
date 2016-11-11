%--------------------------------------------------------------------------
% Function: subsref(q, s)
%
% References methods on a girdle distribution object.
%--------------------------------------------------------------------------

function val = subsref(self, index)

if index(1).type == '.'
	switch index(1).subs
	case 'optimized_points'
		val = self.optimized_points;
	case 'parms'
		val = self.parms;
	case 'points_name'
		val = self.points_name;
	end
	if length(index) > 1
		val = subsref(val, index(2:end));
	end
else
	error('only .field supported')
end
