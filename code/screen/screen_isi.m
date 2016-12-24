if index.escape; return; end

Screen(ptb.screen_w, 'FillRect',  ptb.screen_bg_color);

%% Plot
plot_color;

plot_distance;

%% Time
ptb.screen_time_this = GetSecs;
ptb.screen_time_next = ptb.screen_time_this + trialstruct.vb_isi;


%% Flip
Screen(ptb.screen_w,'Flip');

%% Wait
while GetSecs < ptb.screen_time_next
end
