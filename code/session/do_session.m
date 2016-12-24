    
%% PRE SESSION
screen_presession;

%% SESSION
while ~index.endsession && ~index.escape
    %% TRIAL
    % set trial
    set_trial;
    % do trial
    do_trial;
    
    %% BONUS
    % set bonus
    set_bonus;
    % do bonus
    do_bonus;
    
    %% END OF SESSION
    set_endofsession;
end

%% LOTTERY
% set lottery
set_lottery;
% do lottery
do_lottery;

%% POST SESSION
screen_possession;

%% SAVE
% save data
data_save;
