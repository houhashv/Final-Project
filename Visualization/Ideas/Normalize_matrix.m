function [out]=Normalize_matrix(m)

for i=1:size(m,1)
    if (m(i,1)^2+m(i,2)^2+m(i,3)^2)>0
        out(i,:)=m(i,:)/(m(i,1)^2+m(i,2)^2+m(i,3)^2)^0.5;
    else
        out(i,:)=m(i,:);
    end
end
out=out';

end