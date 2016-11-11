function[s]=check_estimation(mixtures)
%%check_estimation builds a new models from data which is sampled from the
%%vector mixtures and returns a MX2 matrix with the the original mixture
%%and the mixture that is built from data that was sampled from the
%%original mixture. in this way we can check and diagnose if the estimation
%%is propere.
%created by: yossi hohashvili
%email: yossihohashvili1@gmail.com
%january 2016

for i=1:size(mixtures,1)
    dists=which_mixture(mixtures{i});
    [samples,iter]=Acceptence_rejection_composition(mixtures{i},1000);
    a=create_preshape_mixture(dists(1),dists(2),dists(3));
    a=cluster_grasps(a,100000000,samples',1000,3);
    %% taking samples from the mixture model and creating a new model for the 
    %% sampled points int order to check the estimation
   %% name=class(mixtures{i}.parms.dists{i}.parms.dists{1})
    s(i)=struct('mixture_original',mixtures{i},'mixture_samples',a,'pts',samples);

end

end

function[dists]=which_mixture(mix)
%%the function that finds the distributions of the cyclic part of the
%%components in order to make a mixture model
dists=zeros(1,3);
    
for i=1:mix.parms.N
%in this for loop we count the number of components for each possible
%distribution in order to create the new mixture
    if isa(mix.parms.dists{i}.parms.dists{2},'dimrothwatson1')
        dists(1)=dists(1)+1;
    
    elseif isa(mix.parms.dists{i}.parms.dists{2},'dimrothwatson2')
        dists(2)=dists(2)+1;
    
    else isa(mix.parms.dists{i}.parms.dists{2},'vmf')
        dists(3)=dists(3)+1;
    
    end
end

end