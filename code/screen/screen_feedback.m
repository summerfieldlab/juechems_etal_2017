

Screen(ptb.screen_w, 'FillRect',  ptb.screen_bg_color);
Screen(ptb.screen_w, 'TextFont',  parameters.screen_fontname);
Screen(ptb.screen_w, 'TextSize',  parameters.screen_fontsize);
Screen(ptb.screen_w, 'TextColor', parameters.screen_fontcolor);
Screen(ptb.screen_w, 'TextBackgroundColor', parameters.screen_fontbgcolor);

%% verbose
plot_verbose_resp;

%% plot
plot_color;
plot_stimulus;
plot_distance;

%% beep feedback
plot_beep;

%% text feedback
if trialstruct.resp_value >= 0
    DrawFormattedText(ptb.screen_w,sprintf('%+.2f',trialstruct.resp_value),'center',ptb.screen_center(2)+70+parameters.stim_radius,parameters.frame_colors(data.vb_frame(index.trial),:));
else
    DrawFormattedText(ptb.screen_w,sprintf('%+.2f',trialstruct.resp_value),'center',ptb.screen_center(2)+70+parameters.stim_radius,parameters.screen_bk_color);
end

%% Flip
Screen(ptb.screen_w,'Flip');
