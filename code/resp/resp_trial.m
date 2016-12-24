
%% Get secs
gs = GetSecs();

%% read
[down,secs,code] = KbCheck();

%% process
if down && sum(code)==1 && find(code) 
    code = find(code);
    switch code
        % escape
        case KbName(parameters.key_escape)
            index.escape     = 1;
            fprintf('Exit forced by user.\n');
        % gamble
        case KbName(parameters.key_gamble);
            trialstruct.resp_getsecs    = gs;
            trialstruct.resp_rt         = gs - ptb.screen_time_this;
            trialstruct.resp_gamble     = 1;
            if rand() > data.vb_prob(index.trial),  resp_loss;
            else                                    resp_wins;
            end
            screen_feedback;
        % gamble
        case KbName(parameters.key_reject);
            trialstruct.resp_getsecs    = gs;
            trialstruct.resp_rt         = gs - ptb.screen_time_this;
            trialstruct.resp_gamble     = 0;
            trialstruct.resp_value      = parameters.gamble_not;
            screen_feedback;
    end
end

%% clean
clear down secs code;
