%% RETURNS EXPONENTIALLY WEIGHTED SUM OF CUMULATIVE REWARD

function ew_cumu = ew_cumu(values,firsts,zeta)

firsts = find(firsts == 1);
ew_cumu = nan(1,length(values));

for i = 1:length(firsts)-1
    ind = firsts(i):firsts(i+1)-1;
    ew_cumu(ind) = exp_sum(values(ind),zeta);
end
ew_cumu(firsts(end):end) = exp_sum(values(firsts(end):end),zeta);