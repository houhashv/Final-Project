function[x,y,z]=Organize_surface(data,p)

dim=size(data,1);

[theta,phi,r]=cart2sph(data(:,1),data(:,2),data(:,3));
sorted_theta=sort(theta);
sorted_phi=sort(phi);
r=ones(dim,dim);

for i=1:dim
    for j=1:dim
        for k=1:dim
            if sorted_theta(i)==theta(k) && sorted_phi(j)==phi(k);
                r(i,j)=r(i,j)+p(k);
                break;
            end
        end
    end
end
[new_theta,new_phi]=meshgrid(sorted_theta,sorted_phi);
[x,y,z]=sph2cart(new_theta,new_phi,r);    
end