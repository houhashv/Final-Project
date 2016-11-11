function [samples]=Acceptence_rejection_composition_gmm(model,n)
%created by: yossi hohashvili
%email: yossihohashvili1@gmail.com
%january 2016

samples=ones(n,6);
for i=1:n
    dist=gamble(model);
    %%[xyz]=Acceptence_rejection_position(dist.parms.dists{1},1);
    [xyz]=mvnrnd(dist.parms.dists{1}.parms.mu,dist.parms.dists{1}.parms.sigma);
    [abc]=mvnrnd(dist.parms.dists{2}.parms.mu,dist.parms.dists{2}.parms.sigma);
    samples(i,:)=[xyz abc];
    display(strcat(num2str(i),' composite'));
end
end

function [dist]=gamble(model)

sum=0;
u=rand();
    
for i=1:model.parms.N

    sum=sum+model.parms.scale(i);
    if u<sum
        dist=model.parms.dists{i};
        return;
    end
end


end