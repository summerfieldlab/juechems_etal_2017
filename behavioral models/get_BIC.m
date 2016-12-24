% THIS FUNCTION COMPUTES THE BIC GIVEN THE LOG LIKELIHOOD, THE NUMBER OF 
% PARAMETERS, AND THE NUMBER OF CONDITIONS (SUBJECTS)

function BIC = get_BIC(logl,n,k)

% WARNINGS

% CHECKS
if max(size(logl)) > max(size(n)) || ...
   max(size(logl)) > max(size(k)) 
    n = ones(size(logl,1),size(logl,2))*n(1);
    k = ones(size(logl,1),size(logl,2))*k(1);
end

if any(logl < 0)
    a = -1;
else
    a = 1;
end

% FUNCTION CODE
BIC = a*2 * logl + k .* log(n);

end

