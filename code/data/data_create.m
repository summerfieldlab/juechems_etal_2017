
% folder
if ~exist('data','dir'); mkdir('data'); end

% struct
data = struct();

% experiment
data.exp_subject    = zeros(1,0);
data.exp_session    = zeros(1,0);
data.exp_trial      = zeros(1,0);
data.exp_trigger    = zeros(1,0);

% variables
    % time
data.vb_getsecs     = zeros(1,0);
data.vb_isi         = zeros(1,0);
    % frame
data.vb_frame       = zeros(1,0);
data.vb_distance    = zeros(1,0);
data.vb_distoend    = zeros(1,0);
    % task
data.vb_wins        = zeros(1,0);
data.vb_loss        = zeros(1,0);
data.vb_prob        = zeros(1,0);

% response
data.resp_getsecs   = zeros(1,0);
data.resp_rt        = zeros(1,0);
data.resp_gamble    = zeros(1,0);
data.resp_value     = zeros(1,0);
