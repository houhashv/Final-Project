function [samples,iter]=Acceptence_rejection_rotation(dist,n)
%%the function samples n samples from the dist and returns the n samples
%created by: yossi hohashvili
%email: yossihohashvili1@gmail.com
%january 2016

%%finding the value that is blocking f(x)
T=t_orientation(dist);
again=true;
iter=zeros(n,1);
samples=ones(n,4);
for i=1:n
    while again
        %%we now denote the y~r(x) y=[q0 q1 q2 q3]
        q=q_getRandom();
        %%the u2
        u=rand;
        if u<=evaluate(dist,[q(1); q(2); q(3); q(4)])/T
            %%t(y)*u<=f(y)
            again=false;
        end
        iter(i)=iter(i)+1;
    end
    display(strcat(num2str(i),' rotation'))
    samples(i,:)=[q(1) q(2) q(3) q(4)];
    again=true;
end
end

