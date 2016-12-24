%% FINAL MODEL ESTIMATION FOR BORING

% PT PARAMETERS ARE SET BETWEEN 0-5, shift between -1 and +1, and slope at
% 0 to 20
% METHOD IS SIMULATED ANNEALING
% ITERATIONS IS 20 (per left-out run)
% USES CROSS VALIDATION (five-fold, once per scanner run)
% NOTE: As parameters can be traded off against each other, and the method
% of estimation is probabilistic (simulated annealing) or likely to get 
% stuck in local minima (fmincon), results from each run of this script may
% differ slightly from those reported in the paper. 

try 
    [params_main,fits_main,fits_sum_main,BIC_main] = cross_val(data,1:20,{'pt_zero','pt_update','pt_power','pt_cumu'},1,20,'anneal')
catch
    save model_dump_main;
end
save crossval_allsubs_main_models_anneal_20 params_main fits_main fits_sum_main BIC_main
clearvars -except data;
try 
    [params_other,fits_others,fits_sum_others,BIC_others] = cross_val(data,1:20,{'pt_cumuews','pt_lambda','pt_gamma','pt_aspiration'},1,20,'anneal')
catch
    save model_dump_others;
end

save crossval_allsubs_other_models_anneal_20 params_other fits_others fits_sum_others BIC_others

load crossval_allsubs_main_models_anneal_20

% NOTE: THIS REQUIRES SPM
% Order as in Table 1 of the paper 
fits = [fits_sum_main.pt_update,fits_sum_main.pt_zero,fits_sum_main.pt_power,fits_sum_others.pt_lambda];
fits = [fits,fits_sum_others.pt_cumuews,fits_sum_others.pt_gamma,fits_sum_main.pt_cumu,fits_sum_others.pt_aspiration];
[~,~,ex_prob] = spm_BMS(-fits)