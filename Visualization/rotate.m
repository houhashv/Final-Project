function [orientations]=rotate(q,object)
%%this function is used to rotate positions from the default orientation
if strcmp(object,'sphere')
    default=[ 0 -1 0];
else
    default=[0 0 -1];%%this is the unit vector that point to the wrist position in the case of the cup and pan
end
    orientations=quatrotate(q,default);
end