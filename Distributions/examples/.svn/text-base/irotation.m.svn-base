function irotation(flag)
% function irotation(flag)
%
%  Interactive rotation of a 3D plot.  Version 1.1
%
%
%  Usage: Make sure the axes of interest is the current axes; execute
% 'irotation'.  Do not send any parameters - these are used internally.
%
%  Once the call is made, a set of callback routines are permanently 
% attached to the axes.  To move the axes, push the left mouse button
% when the cursor is in the axes.  This action 'grabs' the figure -
% it will then follow your cursor movements until the button is released.
%

if nargin == 0
  flag = 0;
end;

if flag == 0
  irot = get(gcf,'userdata');
  if ~isfield(irot, 'view')
    % This is the first call
    irot.view = [30,30];
    view(irot.view);
    irot.pos = [];
    set(gcf, 'windowbuttondownfcn', 'irotation(1)');
    set(gcf, 'windowbuttonupfcn', 'irotation(2)');
    set(gcf, 'Userdata', irot);
    set(gca, 'Projection' , 'perspective');
    axis vis3d;
  else
    % This is not the first call
    view(irot.view);
  end;
  
elseif flag == 1
  % Button down callback
  gcf = get(0, 'pointerwindow');
  % Make sure gcf is valid
  if gcf ~= 0
    % Set current figure to window in which the button went down.
    figure(gcf);
    % Remember the position click.
    irot = get(gcf,'userdata');
    irot.pos = get(gcf,'currentpoint');
    set(gcf, 'userdata', irot);
    set(gcf, 'windowbuttonmotionfcn', 'irotation(3)');
    set(gcf, 'pointer', 'watch');
  end;
elseif flag == 2
  %  Button-up callback.  Shut off button motion callback, update view.
  gcf = get(0, 'pointerwindow');
  set(gcf,'windowbuttonmotion', '');

  % Update the view with any remaining movement.
  irot = get(gcf,'userdata');
  %  Get current position
  newpos = get(gcf,'currentpoint');
  %  Compute the distance moved since the last update
  diffe = newpos-irot.pos;
  % Update the view and remember this location.
  irot.view = irot.view - diffe/5;
  irot.pos=newpos;
  view(irot.view);
  set(gcf,'userdata', irot);
  set(gcf, 'pointer', 'arrow');
  
elseif flag == 3
  
  % Cursor move callback
  gcf = get(0, 'pointerwindow');
  irot = get(gcf,'userdata');
  %  Get current position
  newpos = get(gcf,'currentpoint');
  %  Compute the distance moved since the last update
  diffe = newpos-irot.pos;
  if(sqrt(sum(diffe.^2))) > 10
    % Above threshold - update the view and remember this location.
    irot.view = irot.view - diffe/5;
    irot.pos=newpos;
    view(irot.view);
    set(gcf,'userdata', irot);
  end;
end;
