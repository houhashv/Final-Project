function [samples,iter]=Acceptence_rejection(model,n)
%%the function samples n samples from the model and returns the n samples
%%and the required iterations to make each sample correspondingly
%created by: yossi hohashvili
%email: yossihohashvili1@gmail.com
%january 2016

pts=model.points';
%%we need the points to find the domain of the multivariable distribution
minx=min(pts(:,1));
maxx=max(pts(:,1));
miny=min(pts(:,2));
maxy=max(pts(:,2));
minz=min(pts(:,3));
maxz=max(pts(:,3));
%%finding the value that is blocking f(x)
T=t_mixture(model);
again=true;
iter=zeros(n,1);
samples=ones(n,7);
for i=1:n
    while again
        %%we now denote the y~r(x) y=[x y z q0 q1 q2 q3]
        x=minx+rand()*(maxx-minx);
        y=miny+rand()*(maxy-miny);
        z=minz+rand()*(maxz-minz);
        q=q_getRandom();
        %%the u2
        u=rand;
        if u<=evaluate(model,[x; y; z; q(1); q(2); q(3); q(4)])/T
            %%t(y)*u<=f(y)
            again=false;
        end
        iter(i)=iter(i)+1;
    end
    display(i);
    samples(i,:)=[x y z q(1) q(2) q(3) q(4)];
    again=true;
end
end

