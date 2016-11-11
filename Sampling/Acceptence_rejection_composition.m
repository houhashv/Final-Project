function [samples,iter]=Acceptence_rejection_composition(model,n)
%%this is a combination between coposition sampling and
%%acceptence-rejection
%created by: yossi hohashvili
%email: yossihohashvili1@gmail.com
%january 2016
iter=zeros(n,1);
samples=ones(n,7);
for i=1:n
    dist=gamble(model);%%desideing which coponent of the mixture model to sample from
    %%[xyz]=Acceptence_rejection_position(dist.parms.dists{1},1);
    [xyz]=mvnrnd(dist.parms.dists{1}.parms.mu,dist.parms.dists{1}.parms.sigma);
    [sample_quat,iter_quat]=Acceptence_rejection_rotation(dist.parms.dists{2},1);
    iter(i)=iter_quat;
    samples(i,:)=[xyz sample_quat];
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