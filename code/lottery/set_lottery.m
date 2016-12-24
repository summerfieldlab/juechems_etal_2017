if parameters.flag_debug, return; end
if index.escape, return; end

%% set bonus
bonus = index.bonus(end-parameters.frame_number+1:end);
if any(bonus < parameters.lottery_min & bonus > parameters.lottery_max)
    bonus(bonus < parameters.lottery_min) = [];
    bonus(bonus > parameters.lottery_max) = [];
elseif any(bonus > 0)
    bonus(bonus < 0) = [];
    bonus = min(bonus);
else
    bonus = max(bonus);
end
index.lottery(end+1) = bonus(randi(numel(bonus)));

%% clean
clear bonus;
