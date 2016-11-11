function [best, iclbest, vmf, dw, girdle, gmm, dw_girdle]=estimate_all_models(data,qdata,components)

%input: the data in the folowing order: [x,y,z,q0,q1,q2,q3]
%input: the data in the folowing order: [x,y,z,xrot,yrot,zrot]
%input: the number of components
%output:
%best: the best mixture model according to the icl crieteria
%iclbest: the icl value of the best mixture model
%vmf: the mixture models which all orientations are distributed vmf
%dw: the mixture models which all orientations are distributed dw
%girdle: the mixture models which all orientations are distributed girdle
%gmm: the mixture models which all orientations are distributed gmm
%dw_girdle: the mixture models which all orientations are distributed
%either dw or girdle. all the options available in a model which the number
%of components is 1-coponents
%created by: yossi hohashvili
%email: yossihohashvili1@gmail.com
%january 2016

    best=1;
	iclbest = 10000000000;

    vmf={};
    dw={};
    girdle={};
    dw_girdle={};
    gmm={};
        
    for i=1:components
       
        vmf{i,1}=create_preshape_mixture(0,0,i);
        dw{i,1}=create_preshape_mixture(i,0,0);
        girdle{i,1}=create_preshape_mixture(0,i,0);
        gmm{i,1}=create_GMM_mixture(i);
        
        vmf{i,1}=cluster_grasps(vmf{i,1},1000000,qdata',1000,10);
        dw{i,1}=cluster_grasps(dw{i,1},1000000,qdata',1000,10);
        girdle{i,1}=cluster_grasps(girdle{i,1},1000000,qdata',1000,10);
        gmm{i,1}=cluster_grasps(gmm{i,1},1000000,data',1000,10);
        
      
        [best,iclbest,vmf{i,2}]=icl_function(vmf{i,1},qdata,iclbest,best);
        [best,iclbest,dw{i,2}]=icl_function(dw{i,1},qdata,iclbest,best);
        [best,iclbest,girdle{i,2}]=icl_function(girdle{i,1},qdata,iclbest,best);
        [best,iclbest,gmm{i,2}]=icl_function(gmm{i,1},data,iclbest,best); 
  
    end
    
    i=1;
    j=1;
    k=0;
    while i<components
        
        k=k+1;
        dw_girdle{k,1}=create_preshape_mixture(i,j,0);
        dw_girdle{k,1}=cluster_grasps(dw_girdle{k,1},1000000,qdata',1000,10);
        [best,iclbest,dw_girdle{k,2}]=icl_function(dw_girdle{k,1},qdata,iclbest,best);
       
        j=j+1;
        if j+i==components+1
            j=1;
            i=i+1;
        end
       
    end
    
end

function [best1, iclbest1, mix_icl]=icl_function(mix,valid1_pts,iclbest,best)

        best1=best;
        iclbest1=iclbest;

        mix_icl = icl(mix, valid1_pts');
		if mix_icl < iclbest
			best1 = mix;
			iclbest1 = mix_icl;
        end
        
end