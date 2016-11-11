%--------------------------------------------------------------------------
% Function: evaluate(dw1, qs)
%
% Evaluates the supplied girdle distribution using the query points qs. qs 
% should be a M x N matrix where M is the dimensionality of each query 
% point, and N is the number of query points. The u1 and u2 parameters of 
% dw2 should have the same number of rows as qs.
%
% param[in] self: A girdle distribution object.
% param[in] qs: An M x N matrix of query points.
% param[out] densities: A 1 x N vector of densities (one for each column of
% qs).
%--------------------------------------------------------------------------

function densities = evaluate(self, qs)
    % if self is not of the correct type
    if ~isa(self, 'dimrothwatson2')
        error('dimrothwatson2.evaluate(): Wrong object');
    end;

	if nargin < 2
		% Get prestored points.
		qs = optimized_points(self);
	else
		qs = optimized_points(self, qs);
	end

    m = size(qs, 1);
    parms = get(self, 'parms');

    % if qs does not have the same number of rows as self.parms.u1 or 
    % self.parms.u2
    if(m ~= size(parms.u1,1) | m ~= size(parms.u2,1))
        error(['dimrothwatson2.evaluate(): qs must have the same ', ...
            'number or rows as dw2.parms.u1 and dw2.parms.u2']);
    end;

    u1 = parms.u1;
    u2 = parms.u2;
    k = parms.k;
    qsT = qs';
    densities = estimate_F_bar(k) * exp(k * ((qsT * u1).^2 + (qsT * u2).^2))';
end

%--------------------------------------------------------------------------
% Function: estimate_F_bar(k)
%
% Estimates the value of the F(k) bar function for the specified value of k.
%
% param[in] k: The concentration parameter.
% param[out] out: The estimated value of F(k) bar.
%--------------------------------------------------------------------------

function Fk_bar = estimate_F_bar(k)

    x = [0.1444    0.7816   -0.0936    0.9325];    
    Fk_bar = x(1) .* exp(- x(2) .* k) + x(3) .* exp(- x(4) .* k);
end
