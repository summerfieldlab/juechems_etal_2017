
if isnan(trialstruct.resp_gamble)
    trialstruct.resp_value  = parameters.gamble_miss;
    screen_feedback;
end
