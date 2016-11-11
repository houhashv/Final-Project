%--------------------------------------------------------------------------
% Function: get(a, prop_name)
%
% Returns the specified property value from the specified object. Valid
% property names include 'parms' and 'descriptor'.
%
% param[in] a: An object.
% param[in] prop_name: A property name.
% param[out] val: The value of the specified property.
%--------------------------------------------------------------------------

function val = get(a, prop_name)

switch prop_name
    case 'parms'
        val = a.parms;
    case 'descriptor'
        val = a.descriptor;
    otherwise
        error(['vmf.get(): ', prop_name, ...
            ' is not a valid asset property']);
end