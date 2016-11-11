%--------------------------------------------------------------------------
% Function: cluster_grasps(m, micl, pts, nsteps, nattempts)
%
% Learns the parameters of the supplied mixture model m using the samples
% in pts. The EM algorithm is used to set the parameters and weights
% of each component distribution in m. The EM algorithm is performed 
% nattempts times (each taking nsteps steps), and the mixture with the
% best ICL value on the validation set pts is returned.
%
% param[in] m: A mixture distribution object.
% param[in] micl: The icl value for m.
% param[in] pts: A matrix of samples (each a column vector)
% param[in] nsteps: The number of EM steps performed.
% param[in] nattempts: The number of times the EM algorithm is performed.
% param[out] mbest: The best mixture model according to the ICL criterion.
% param[out] iclbest: The icl value of mbest.
%--------------------------------------------------------------------------

function [mbest,iclbest] = cluster_grasps(m, micl, pts, nsteps, nattempts)
	mbest = m;
	iclbest = micl;

	% perform EM nattempts times and take the best one according to ICL
	tic;
	steps = m.parms.steps;
	for j = 1:nattempts
		mix = initEM(m, pts);
		mix.parms.steps = steps;
		mix = nstepsEM(mix, nsteps, 0, pts); % take nsteps EM steps
		steps = mix.parms.steps;

		% evaluate the resulting model using icl
		mix_icl = icl(mix, pts);

		if mix_icl < iclbest
			mbest = mix;
			iclbest = mix_icl;
		end
	end
	% Make sure to record the full list of steps.
	mbest.parms.steps = steps;
	toc
end
