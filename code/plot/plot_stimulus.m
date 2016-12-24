
%% plot circles

% black
Screen( ptb.screen_w,                                                               ... window
        'FillOval',                                                                 ... fill oval
        parameters.screen_bk_color,                                                 ... color
        [   ptb.screen_center - parameters.stim_radius - parameters.frame_thick,    ... rectangle
            ptb.screen_center + parameters.stim_radius + parameters.frame_thick     ...
        ] ...
    );

% background
Screen( ptb.screen_w,                                                               ... window
        'FillOval',                                                                 ... fill oval
        parameters.screen_fontcolor,                                                 ... colour
        [   ptb.screen_center - parameters.stim_radius,                             ... rectangle
            ptb.screen_center + parameters.stim_radius                              ...
        ] ...
    );

% probability
Screen( ptb.screen_w,                                                               ... window
        'FillArc',                                                                  ... fill oval
        parameters.frame_colors(data.vb_frame(index.trial),:),                      ... color
        [   ptb.screen_center - parameters.stim_radius,                             ... rectangle
            ptb.screen_center + parameters.stim_radius                              ...
        ],                                                                          ...
        0,                                                                          ... start angle
        360*data.vb_prob(index.trial)                                               ... angle
    );

%% plot text
% loss
[nx, ny, textbounds] = DrawFormattedText(ptb.screen_w,sprintf('%+.2f',data.vb_loss(index.trial)),'center','center');
width_text = textbounds(3)-textbounds(1);
DrawFormattedText(ptb.screen_w,sprintf('%+d',data.vb_loss(index.trial)),ptb.screen_rect(1)+0.43*ptb.screen_drect(1)-width_text,'center',parameters.screen_fontcolor);
% win
DrawFormattedText(ptb.screen_w,sprintf('%+d',data.vb_wins(index.trial)),ptb.screen_rect(1)+0.57*ptb.screen_drect(1),'center',parameters.frame_colors(data.vb_frame(index.trial),:));

%% Clean
clear nx ny textbounds;
clear width_text;
