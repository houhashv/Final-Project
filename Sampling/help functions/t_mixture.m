function [t]=t_mixture(model)
%%calculating the t(x) function that blocks the f(x). t(x) is said to be
%%the maximum value of f(x) which the value of f(x) in the mean vector.
%created by: yossi hohashvili
%email: yossihohashvili1@gmail.com
%january 2016

    t=0;
    for i=1:model.parms.N
        %%taking the sums of the scaled fi(x) for all i's from 1 to number
        %%of components
        dis1=model.parms.dists{i}.parms.dists{1};
        %%the gaussian part of the composite distribution
        dis2=model.parms.dists{i}.parms.dists{2};
        %%the cyclic part of the composite distribution
        scale=model.parms.scale(i);
        %%the weight  of the component
        mu1=dis1.parms.mu;
        if strcmp(class(dis2),'dimrothwatson2')
            %%for girdle distributions it is easy to take one of the 2 mean
            %%vectors because they are perpendicular
            mu2=dis2.parms.u1;
        elseif strcmp(class(dis2),'gaussian1')
            mu2=dis2.parms.mu';
        else
            mu2=dis2.parms.u;
        end
        %%suming the products of all the weighted probabilitys of the components 
        t=t+scale*evaluate(dis1,mu1')*evaluate(dis2,mu2);
    end
end
