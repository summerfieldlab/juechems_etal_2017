
n_trials = parameters.task_nbtrials;
n_gamble = length(parameters.gamble_wins);
n_bigger = ceil(n_trials./n_gamble) * n_gamble;

%% set shuffle
ii_gamble = randperm(n_bigger);
ii_gamble(n_trials+1 : end) = [];

%% set gamble
wins = repmat(parameters.gamble_wins,1, n_bigger./n_gamble); wins = wins(ii_gamble);
loss = repmat(parameters.gamble_loss,1, n_bigger./n_gamble); loss = loss(ii_gamble);
prob = repmat(parameters.gamble_prob,1, n_bigger./n_gamble); prob = prob(ii_gamble);

%% set data
data.vb_wins = wins;
data.vb_loss = loss;
data.vb_prob = prob;

%% clear
clear n_trials n_gamble n_bigger;
clear ii_gamble;
clear wins loss prob;

