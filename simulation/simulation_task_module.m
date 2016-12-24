%% THIS FUNCTION HANDLES THE CONSEQUENCES OF THE CHOICE TAKEN BY THE
% SIMULATION AND UPDATES THE CUMULATIVE ACCORDINGLY

function task = simulation_task_module(params,task)

% INITIALIZE
n_trials        = max(size(task.wins));
task.cumu       = nan(1,n_trials);
task.outcome 	= nan(1,n_trials);
task.p_gamble   = nan(1,n_trials);

% Loop through all trials
for trial = 1:n_trials;
   
    % Update Cumu
    if trial == 1 || task.firsts(trial) == 1
        task.cumu(trial) = 0;
    else
        task.cumu(trial) = task.outcome(trial-1) + task.cumu(trial-1);
    end
    
    % Get actor's p_gamble
%     task.p_gamble(trial) = simulation_PT_utility(params,struct_filter(task,trial));
    task.p_gamble(trial) = simulation_PT_utility_adaptive(params,struct_filter(task,trial));
    
    % Resolve task
    r = rand;
    if r <= task.p_gamble(trial)
        r = rand;
        if r <= task.prob(trial)
            task.outcome(trial) = task.wins(trial);
        else
            task.outcome(trial) = task.loss(trial);
        end
    else
        task.outcome(trial) = -0.1;
    end

end

