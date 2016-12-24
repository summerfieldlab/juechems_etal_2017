%% Compare sliding shift with EV_max with respect to outcome distribution
% at the end of a colour --> is outcome variance reduced for sliding shift
% model?

function [out] = simulation_PT_main(params,delta,n_iter)

params = [params,delta];

tic()
% SETTINGS
n_trials = 75;

for iter = 1:n_iter
    % Creates a random task with specification used in experiment
    task = create_random_session(n_trials);
    
    % Remove unnecessary fields (legacy of old version)
    task = rmfield(task,{'ev'});
    
    % Test models on the random task
    tmp = simulation_task_module(params,task);
    outs(iter) = rmfield(tmp,{'wins','loss','prob','p_gamble'});
end

out = outs(1);
for i = 2:n_iter
    out = aux_catstruct(out,outs(i));
end

toc()

end
        
        
        