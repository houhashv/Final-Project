function[the_best,ICL]=find_gmm_the_best(bests)
%%the ICL comparisen between the bests and chooseing the best model for
%%orientations distributed gaussian
%created by: yossi hohashvili
%email: yossihohashvili1@gmail.com
%january 2016

ICL=1000000000;%%the initialized icl value
number_of_models=size(bests,1);%%taking the size for the counter

for i=1:number_of_models
    if bests{i,2}<ICL && isa(bests{i,1}.parms.dists{1}.parms.dists{2},'gaussian1')
        the_best=bests{i,1};%%updating the best model
        ICL=bests{i,2};%%updating the icl
    end
end

end