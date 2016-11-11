%--------------------------------------------------------------------------
% Function: subsref(q, s)
%
% References methods on a composite distribution object.
%--------------------------------------------------------------------------

function val = subsref(self, index)

if index(1).type == '.'
    switch index(1).subs
	case 'optimized_points'
		% No special handling of "optimized" points for composite.
		val = self.points;
    case 'parms'
        val = self.parms;
    case 'points_name'
        val = '';
	otherwise
		error(['Invalid field name: ' index(1).subs])
    end
	if length(index) > 1
		val = subsref(val, index(2:end));
	end
else
    error('Only .field supported')
end
