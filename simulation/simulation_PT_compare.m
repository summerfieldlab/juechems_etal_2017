%% THIS SCRIPT COMPARES THE SIMULATIONS BASED ON DIFFERENT PARAMETERS

% INIT
n_delta = 10;
n_iter  = 10000;
params = [1,1,1,0,10^16];
deltas  = [linspace(-0.5,0.5,n_delta),0];
n_delta = n_delta + 1;
outs = struct('deltas',mat2cell(deltas,1,ones(1,n_delta)),...
              'payoffs',[],...
              'lengths',[],...
              'maxs',[]);

tic;
% Loop through deltas
parfor i = 1:n_delta
    outcomes = simulation_PT_main(params,deltas(i),n_iter);
    outs(i).payoffs = outcomes.cumu(outcomes.dist == 1) + outcomes.outcome(outcomes.dist == 1);
    outs(i).lengths = outcomes.lngth(outcomes.dist == 1);
    outs(i).maxs = outs(i).payoffs(outs(i).lengths == 21);
end
toc;

p(n_delta) = sum(outs(n_delta).maxs >= 0) / max(size(outs(n_delta).maxs));

% Get p of survival (outcomes > 0)
for i = 1:n_delta
    p(i) = sum(outs(i).maxs > 0) / max(size(outs(i).maxs));
    means(i) = mean(outs(i).maxs);
    vars(i)  = var(outs(i).maxs);
    sizes(i) = size(outs(i).maxs,2);
    fprintf('\n Update of %+1.3f has p = %1.5f of staying alive',deltas(i),p(i));
end
fprintf('\n');

aux_scatter(deltas,p);
    