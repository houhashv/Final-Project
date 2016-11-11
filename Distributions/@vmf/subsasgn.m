function self = subsasgn(self, index, val)

if strcmp(index.type , '.')
	switch index.subs
	case 'points'
		self.points = val;
		self.optimized_points = optimized_points(self, val);
	case 'points_name'
		self.points_name = val;
	otherwise
		error('Invalid field name')
	end
else
	error('only .field supported')
end
