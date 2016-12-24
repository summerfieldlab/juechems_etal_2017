
% index
index.trial = index.trial + 1;

% trial struct
trialstruct = struct();
trialstruct.vb_getsecs      = nan;
trialstruct.vb_isi          = parameters.time_isimin + (parameters.time_isimax - parameters.time_isimin) * rand();
trialstruct.resp_getsecs    = nan;
trialstruct.resp_rt         = nan;
trialstruct.resp_gamble     = nan;
trialstruct.resp_value      = nan;
