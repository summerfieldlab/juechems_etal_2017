
%% set keys
keys = parameters.key_keys;
parameters.key_gamble = keys(mod(index.subject    ,2)+1);
parameters.key_reject = keys(mod(index.subject + 1,2)+1);

%% clean
clear keys;