function val = get(a,prop_name)
% GET Get asset properties from the specified object
% and return the value
switch prop_name
 case 'parms'
  val = a.parms;
 case 'descriptor'
  val = a.descriptor;
 otherwise
  error([prop_name,' Is not a valid asset property'])
end