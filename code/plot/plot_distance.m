


Screen(ptb.screen_w, 'TextFont',  parameters.screen_fontname);
Screen(ptb.screen_w, 'TextSize',  parameters.screen_fontsize);
Screen(ptb.screen_w, 'TextColor', parameters.frame_colors(data.vb_frame(index.trial),:));
Screen(ptb.screen_w, 'TextBackgroundColor', parameters.screen_fontbgcolor);

%% Fixation
% frame
Screen( ptb.screen_w,                                           ... window
    'FillOval',                                                 ... fill oval
    parameters.frame_colors(data.vb_frame(index.trial),:),      ... color
    [   ptb.screen_center - parameters.frame_fixation - .5*parameters.frame_thick,  ... rectangle
        ptb.screen_center + parameters.frame_fixation + .5*parameters.frame_thick   ...
    ]                                                           ...
);

% background
Screen( ptb.screen_w,                                           ... window
    'FillOval',                                                 ... fill oval
    parameters.screen_bg_color,                                 ... color
    [   ptb.screen_center - parameters.frame_fixation + .5*parameters.frame_thick,  ... rectangle
        ptb.screen_center + parameters.frame_fixation - .5*parameters.frame_thick   ...
    ]                                                           ...
);

%% Plot
DrawFormattedText(  ...
        ptb.screen_w,                                           ... window
        sprintf('%d',data.vb_distance(index.trial)),            ... text
        'center',                                               ... sx
        'center',                                               ... sy
        parameters.frame_colors(data.vb_frame(index.trial),:)   ... color
    );
