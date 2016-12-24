%% CALCULATES THE EXPONENTIALLY WEIGHTED SUM OF A SERIES

function ews = exp_sum(series,zeta)

ews = nan(1,length(series));
% ews(1) = 0;
ews(1) = series(1);
for i = 2:length(series)
    ews(i) = zeta * series(i) + (1-zeta)*ews(i-1);
end