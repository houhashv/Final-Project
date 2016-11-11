function [t]=t_orientation(dist)
%%calculating the t(x) function that blocks the f(x). t(x) is said to be
%%the maximum value of f(x) which the value of f(x) in the mean vector.
%created by: yossi hohashvili
%email: yossihohashvili1@gmail.com
%january 2016

    t=0;

        %%taking the sums of the scaled fi(x) for all i's from 1 to number
        %%of components
        if strcmp(class(dist),'dimrothwatson2')
            %%for girdle distributions it is easy to take one of the 2 mean
            %%vectors because they are perpendicular
            u=dist.parms.u1;
        else
            u=dist.parms.u;
        end
        %%suming the products of all the weighted probabilitys of the components 
        t=evaluate(dist,u);
end
