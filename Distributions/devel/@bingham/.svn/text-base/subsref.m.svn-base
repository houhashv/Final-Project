%SUBSREF Reference methods on a BINGHAM object
%

function v = subsref(q, s)

if s(1).type  == '.'

  el = char(s(1).subs);
  switch el,
   case 'parms',
    v = q.parms;
  end
else
  error('only .field supported')
end

