function val = get(self, prop_name)

switch prop_name
	case 'descriptor'
		val = self.descriptor;
	case 'points_name'
		val = self.points_name;
	case 'parms'
		val = self.parms;
	case 'optimized_points'
		val = self.optimized_points;
	case 'points'
		val = self.points;
	otherwise
		error([prop_name ' is not a valid asset property'])
end
