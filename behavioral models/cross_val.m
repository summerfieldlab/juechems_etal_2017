% FUNCTION WHICH COMPUTES THE CROSS VALIDATED PARAMETERS AND FITS FOR THE
% MODELS SPECIFIED IN models

function [params,fits,fits_sum,BIC] = cross_val(data,subs,models,crossval,n_Iter,flag)

% INITIALIZE
rng('shuffle');
params = struct();
fits   = struct();
fits_sum = struct();
BIC    = struct();
n_sub = max(size(subs));

k = struct();
k.pt_zero = 5;
k.pt_update = 6;
k.pt_cumu = 5;
k.pt_cumuews = 6;
k.pt_power = 6;
k.pt_lambda = 6;
k.pt_gamma = 6;

n_block = 5;

tic()

% Do this for all models
for mod = 1:size(models,2)
    curr_mod = models{mod};
    curr_k   = k.(curr_mod);
    curr_params = nan(n_block,curr_k,n_sub);
    curr_fits = nan(n_sub,n_block);
    % Go through all participants specified in subs
    parfor i = 1:n_sub
        [curr_params(:,:,i),curr_fits(i,:)] = choice_crossval(data,subs(i),curr_mod,ones(1,curr_k),crossval,n_Iter,flag);
    end
    % Save
    params.(curr_mod)   = curr_params;
    fits.(curr_mod)     = curr_fits;
    fits_sum.(curr_mod) = nansum(curr_fits,2);
    BIC.(curr_mod)      = get_BIC(nansum(fits_sum.(curr_mod)),n_block*n_sub,k.(curr_mod));
    fprintf('\nFinished estimating model %s \n\n',curr_mod);
end
toc()

end