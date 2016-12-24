
%% Bonuses
bonus = index.bonus(end - data.vb_frame(index.trial) + 2 : end);

%% Plot colors
n_frame = parameters.frame_number;

for i_frame = 1:n_frame
    
    % circle (color)
    position =  [   ptb.screen_rect(1) + ptb.screen_drect(1) * (i_frame) / (n_frame+1),   ...
                    ptb.screen_rect(2) + (2 * parameters.frame_small) ...
                ];
    Screen( ptb.screen_w,                                           ... window
            'FillOval',                                             ... fill oval
            parameters.frame_colors(i_frame,:),                     ... color
            [   position - .5 * parameters.frame_small,             ... rectangle
                position + .5 * parameters.frame_small              ...
            ]                                                       ...
        );
    
    % text (bonus)
    if length(bonus)>=i_frame
        position =  [   ptb.screen_rect(1) + ptb.screen_drect(1) * (i_frame) / (n_frame+1),   ...
                        ptb.screen_rect(2) + (3 * parameters.frame_small) ...
                    ];
        [nx, ny, textbounds] = DrawFormattedText(ptb.screen_w,sprintf('%.2f',bonus(i_frame)),'center','center');
        width_text = textbounds(3)-textbounds(1);
        DrawFormattedText(  ptb.screen_w,                                           ... window
                            sprintf('%.2f',bonus(i_frame)),                         ... text
                            position(1)-0.5*width_text,                             ... sx
                            position(2),                                            ... sy
                            parameters.frame_colors(i_frame,:)                      ... color
                        );
    end
    
end

%% Clean
clear bonus;
clear nx ny textbounds width_text;
clear n_frame i_frame position;