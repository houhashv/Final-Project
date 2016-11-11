function [samples,iter]=Acceptence_rejection_position(dist,n)
%%the function samples n samples from the dist and returns the n samples
%created by: yossi hohashvili
%email: yossihohashvili1@gmail.com
%january 2016

%%finding the value that is blocking f(x)
T=evaluate(dist,dist.parms.mu');
again=true;
iter=zeros(n,1);
samples=ones(n,dist);
for i=1:n
    while again
        %%we now denote the y~r(x) y=[q0 q1 q2 q3]
        [xyz]=mvnrnd(dist.parms.mu,dist.parms.sigma);
        %%the u2
        u=rand;
        if u<=evaluate(dist,xyz')/T
            %%t(y)*u<=f(y)
            again=false;
        end
        iter(i)=iter(i)+1;
    end
    display(strcat(num2str(i),' position'))
    samples(i,:)=xyz;
    again=true;
end
end
