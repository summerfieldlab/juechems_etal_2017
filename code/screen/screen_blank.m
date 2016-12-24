if index.escape; return; end

if data.vb_distance(index.trial)==1
    Screen(ptb.screen_w, 'FillRect',  ptb.screen_bg_color);

    %% Time
    blankmin = parameters.time_blankmin;
    blankmax = parameters.time_blankmax;
    blank    = blankmin + rand()*(blankmax - blankmin);
    ptb.screen_time_this = GetSecs;
    ptb.screen_time_next = ptb.screen_time_this + blank;

    %% Flip
    Screen(ptb.screen_w,'Flip');

    %% Wait
    while GetSecs < ptb.screen_time_next
    end

    %% Clean
    clear blankmin blankmax blank;
end