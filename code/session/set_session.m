
%% index
index.session       = index.session + 1;
index.trial         = 0;
index.endsession    = 0;
index.gs_trigger    = nan;

%% data
data_create;

%% task
set_color;
set_frame;
set_gamble;

%% filenames
set_filenames;
