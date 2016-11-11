function [q_full,q_vec]=cirrdnPJ(vec)
%the function, must be on a folder in matlab path
roll=linspace(0,2*pi,size(vec,1));
roll=roll';
q_full=[cos(roll) sin(roll).*vec(:,1) sin(roll).*vec(:,2) sin(roll).*vec(:,3)];
q_vec=vec;

end
%to test the function
