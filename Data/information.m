function []=information(mixture)
 %%function that given a mixture object prints all the information about a 
 % the mixture model's parameters
display(mixture.parms);
%%printig the general information
for i=1:mixture.parms.N
    %%printing the parameters about evry components
    
    %%the position parametrs information
    display(strcat('w',num2str(i),'=',num2str(mixture.parms.scale(i))));
    display(strcat('component ',num2str(i),'gauss: mu ='));
    display(mixture.parms.dists{i}.parms.dists{1}.parms.mu);
    display(strcat('component ',num2str(i),'gauss: sigma ='));
    display(mixture.parms.dists{i}.parms.dists{1}.parms.sigma);
    %%the orientation parameters information
    if isa(mixture.parms.dists{i}.parms.dists{2},'dimrothwatson2')
        %%if the distribution of the orientations in girdle
        display(strcat('component ',num2str(i),'girdle: u1 ='));
        display(mixture.parms.dists{i}.parms.dists{2}.parms.u1);
        display(strcat('component ',num2str(i),'girdle: u2 ='));
        display(mixture.parms.dists{i}.parms.dists{2}.parms.u2);
        display(strcat('component ',num2str(i),'girdle: k ='));
        display(mixture.parms.dists{i}.parms.dists{2}.parms.k);
    else
        %% if the distribution of the orientation is another cyclic
        %%distribuition
        display(strcat('component ',num2str(i)));
        display(mixture.parms.dists{i}.parms.dists{2});
        display(' u =');
        display(mixture.parms.dists{i}.parms.dists{2}.parms.u);
        display(strcat('component ',num2str(i)));
        display(mixture.parms.dists{i}.parms.dists{2});
        display(' k =');
        display(mixture.parms.dists{i}.parms.dists{2}.parms.k);
    end
end

end