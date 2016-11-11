function [the_best,bests,ICL]=the_best_model(models)
% the function that is finding the best model
%created by: yossi hohashvili
%email: yossihohashvili1@gmail.com
%january 2016
number_of_models=size(models,1);
bests=first_eliminataion(models,number_of_models);%%eliminating the first models out
[the_best,ICL]=second_elimination(bests);%%taking the best model according to ICL

end

function[bests]=first_eliminataion(models,number_of_models)

k=1;
bests={};
%%the number of bests 

for i=1:number_of_models
  
    max_w=max(models{i}.parms.scale);
    min_w=min(models{i}.parms.scale);
    if max_w/min_w<=5%%eliminate all the models that has wights smaler than the threshold
        bests{k,1}=models{i};
        bests{k,2}=icl(bests{k,1},bests{k,1}.points);
        k=k+1;
    end
end

end

function[the_best,ICL]=second_elimination(bests)
%%the ICL comparosin between the bests and chooseing the best model
ICL=1000000000;%%the initialized icl value
number_of_models=size(bests,1);%%taking the size for the counter

for i=1:number_of_models
    if bests{i,2}<ICL
        the_best=bests{i,1};%%updating the best model
        ICL=bests{i,2};%%updating the icl
    end
end

end