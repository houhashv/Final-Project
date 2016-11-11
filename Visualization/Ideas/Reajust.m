function [out]=Reajust(m,p)

for i=1:size(m,1)
    for j=1:3
            if m(i,j)<0
                out(i,j)=m(i,j)-p(i)/(3)^0.5;
            elseif m(i,j)>0
                out(i,j)=m(i,j)+p(i)/(3)^0.5;
            end
        end
end
end