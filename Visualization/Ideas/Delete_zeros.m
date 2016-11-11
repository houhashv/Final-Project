function [out]=Delete_zeros(m)

    [d,f]=size(m);
    k=0;
    for i=1:d
        sum=0;
        for j=5:f
            sum=sum+m(i,j)^2;
        end
        if sum~=0;
            k=k+1;
            out(k,:)=m(i,:);
        end
    end
        
end