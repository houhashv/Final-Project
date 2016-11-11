function [all_cup,all_pan,all_sphere]=Uniteing(the_bests_sphere,the_bests_pan,the_bests_cup)
%%gathering all the mixture models in to one matrix(like a table of
%%information to show all the information regarding the mixture models
all_sphere=zeros(size(the_bests_sphere,1),5);
all_pan=zeros(size(the_bests_pan,1),5);
all_cup=zeros(size(the_bests_cup,1),5);

for i=1:size(the_bests_sphere,1)
    for j=1:the_bests_sphere{i,1}.parms.N
        if isa(the_bests_sphere{i,1}.parms.dists{j}.parms.dists{2},'gaussian1')
            all_sphere(i,4)=all_sphere(i,4)+1;
        end
        if isa(the_bests_sphere{i,1}.parms.dists{j}.parms.dists{2},'dimrothwatson1')
            all_sphere(i,1)=all_sphere(i,1)+1;
        end
        if isa(the_bests_sphere{i,1}.parms.dists{j}.parms.dists{2},'dimrothwatson2')
            all_sphere(i,2)=all_sphere(i,2)+1;
        end
        if isa(the_bests_sphere{i,1}.parms.dists{j}.parms.dists{2},'vmf')
            all_sphere(i,3)=all_sphere(i,3)+1;
        end
    end
    all_sphere(i,5)=the_bests_sphere{i,2};
end

for i=1:size(the_bests_cup,1)
    for j=1:the_bests_cup{i,1}.parms.N
        if isa(the_bests_cup{i,1}.parms.dists{j}.parms.dists{2},'gaussian1')
            all_cup(i,4)=all_cup(i,4)+1;
        end
        if isa(the_bests_cup{i,1}.parms.dists{j}.parms.dists{2},'dimrothwatson1')
            all_cup(i,1)=all_cup(i,1)+1;
        end
        if isa(the_bests_cup{i,1}.parms.dists{j}.parms.dists{2},'dimrothwatson2')
            all_cup(i,2)=all_cup(i,2)+1;
        end
        if isa(the_bests_cup{i,1}.parms.dists{j}.parms.dists{2},'vmf')
            all_cup(i,3)=all_cup(i,3)+1;
        end
    end
    all_cup(i,5)=the_bests_cup{i,2};
end

for i=1:size(the_bests_pan,1)
    for j=1:the_bests_pan{i,1}.parms.N
        if isa(the_bests_pan{i,1}.parms.dists{j}.parms.dists{2},'gaussian1')
            all_pan(i,4)=all_pan(i,4)+1;
        end
        if isa(the_bests_pan{i,1}.parms.dists{j}.parms.dists{2},'dimrothwatson1')
            all_pan(i,1)=all_pan(i,1)+1;
        end
        if isa(the_bests_pan{i,1}.parms.dists{j}.parms.dists{2},'dimrothwatson2')
            all_pan(i,2)=all_pan(i,2)+1;
        end
        if isa(the_bests_pan{i,1}.parms.dists{j}.parms.dists{2},'vmf')
            all_pan(i,3)=all_pan(i,3)+1;
        end
    end
    all_pan(i,5)=the_bests_pan{i,2};
end

end