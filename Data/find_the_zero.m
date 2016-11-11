function[x]=find_the_zero(a)
%for a matrix which columns are [x,y,z,xrot,yrot,zrot] we find the rows in
%which xrot,yrot,zrot are all zero
n=size(a,1);
k=1;
for i=1:n

    if sum(a(i,10:12))==0
        x(k)=i;
        k=k+1;
    end
end
end