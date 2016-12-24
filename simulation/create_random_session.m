function task = create_random_session(n_trials)

task = struct();

% PARAMETERS
wins = [1,3];
loss = [-3,-1];
prob = [1/3,0.5,2/3];
block_min = 3;
block_max = 22;
blocks = 5;

firsts = zeros(1,n_trials+1);
firsts(1) = 1;
firsts(end) = 1;
lengths = block_max + 1;
while (any(lengths > block_max) || ...
       any(lengths < block_min) || ...
       f(end) > n_trials-block_min-1 ||...
       f(end) < n_trials-block_max-1)
    firsts = zeros(1,n_trials+1);
    firsts(1) = 1;
    firsts(end) = 1;
    f = randsample([block_min:block_max],blocks-1,1);
    f = cumsum(f);
    firsts(f(f < n_trials)) = 1;
    lengths = diff(find(firsts));
end

firsts(end) = [];
lngth = lengths(1);
count = 0;
for i = 1:n_trials
    if firsts(i) == 1 && i > 1
        lengths(1) = [];
        lngth = lengths(1);
        count = 0;
    end
    task.dist(i)  = lngth-count;
    task.lngth(i) = lngth;
    count = count + 1;
end

task.wins = randi(wins,1,n_trials);
task.loss = randi(loss,1,n_trials);
task.prob = randsample(prob,n_trials,1); %replacement = 1;
task.ev   = task.wins.*task.prob + task.loss.*(1-task.prob);
task.ev   = round(task.ev*100) ./ 100;
task.firsts = firsts;