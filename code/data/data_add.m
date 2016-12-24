if index.escape; return; end






% experiment
data.exp_subject(end+1)     = index.subject;
data.exp_session(end+1)     = index.session;
data.exp_trial(end+1)       = index.trial;
data.exp_trigger(end+1)     = index.gs_trigger;

% variables
data.vb_getsecs(end+1)      = trialstruct.vb_getsecs;
data.vb_isi(end+1)          = trialstruct.vb_isi;

% response
data.resp_getsecs(end+1)    = trialstruct.resp_getsecs;
data.resp_rt(end+1)         = trialstruct.resp_rt;
data.resp_gamble(end+1)     = trialstruct.resp_gamble;
data.resp_value(end+1)      = trialstruct.resp_value;
