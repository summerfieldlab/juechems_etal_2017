

Screen(ptb.screen_w, 'FillRect',  ptb.screen_bg_color);

%% Verbose
plot_verbose_trial;

%% Plot
plot_color;
plot_stimulus;
plot_distance;

%% Time
ptb.screen_time_this = GetSecs;
ptb.screen_time_next = ptb.screen_time_this + parameters.time_trial;
trialstruct.vb_getsecs = ptb.screen_time_this;

%% Flip
Screen(ptb.screen_w,'Flip');

%% Wait (trial)
% get response
gs = GetSecs();
while   gs < ptb.screen_time_next          && ... time
        isnan(trialstruct.resp_gamble)     && ... response
        ~index.escape                         ... exit
        
    % resonse
    resp_trial;
    
end

%% no response
resp_none;

%% Wait (trial)
while GetSecs < ptb.screen_time_next
end

%% Time
ptb.screen_time_this = GetSecs;
ptb.screen_time_next = ptb.screen_time_this + parameters.time_feedback;

%% Wait (feedback)
while GetSecs < ptb.screen_time_next
end

%% Clean
clear gs;
