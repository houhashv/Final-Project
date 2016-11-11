function [t]=t_distribution(dist)
%%calculating the t(x) function that blocks the f(x). t(x) is said to be
%%the maximum value of f(x) which the value of f(x) in the mean vector.
%created by: yossi hohashvili
%email: yossihohashvili1@gmail.com
%january 2016

    t=0;
    dis1=dist.parms.dists{1};
    %%the gaussian part of the composite distribution
    dis2=dist.parms.dists{2};
    %%the cyclic part of the composite distribution
    mu1=dis1.parms.mu;
    if strcmp(class(dis2),'dimrothwatson2')
        %%for girdle distributions it is easy to take one of the 2 mean
        %%vectors because they are perpendicular
        mu2=dis2.parms.u1;
    else
        mu2=dis2.parms.u;
    end
    %%suming the products of all the weighted probabilitys of the components 
    t=evaluate(dis1,mu1')*evaluate(dis2,mu2);
    
end
