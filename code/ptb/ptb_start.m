
ptb = struct();

%% Preferences
% verbosity
Screen('Preference', 'Verbosity',0);
Screen('Preference', 'SuppressAllWarnings', 1);
% skip tests
if parameters.flag_debug        Screen('Preference', 'SkipSyncTests', 1);
else                            Screen('Preference', 'SkipSyncTests', 2);
end

%% Time
ptb.time_start = GetSecs;

%% Screen
% open window
[tmp_w, tmp_r] = Screen('OpenWindow',                           ...
                            tools_index(Screen('Screens'),0),   ... screen
                            [],                                 ... color
                            parameters.screen_rect,             ... rectangle
                            32,                                 ... pixel size
                            2                                   ... nb of buffers
                        );

% values
ptb.screen_w            = tmp_w;
ptb.screen_rect         = tmp_r;
ptb.screen_drect        = [(ptb.screen_rect(3)-ptb.screen_rect(1)) , (ptb.screen_rect(4)-ptb.screen_rect(2))];
ptb.screen_center       = [ptb.screen_rect(1) , ptb.screen_rect(2)] + .5*ptb.screen_drect;
ptb.screen_bg_color     = parameters.screen_bg_color;
ptb.screen_time_this    = 0;
ptb.screen_time_next    = 0;
ptb.screen_fps          = Screen('FrameRate',ptb.screen_w);

% textures
Screen('Preference', 'TextAlphaBlending', 1);
Screen(ptb.screen_w,'BlendFunction',GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);

%% Mouse
HideCursor;

%% Keyboard
KbName('UnifyKeyNames');

%% Audio
% set parameters
ptb.audio_freqlow  = 2500;
ptb.audio_freqhigh = 7500;
ptb.audio_duration  = 0.1;

% initialise port
PsychPortAudio('Verbosity',0);
InitializePsychSound;
try
    ptb.audio_port = PsychPortAudio('Open', [], [], 1, [], 1);
catch
    psychlasterror('reset');
    ptb.audio_port = PsychPortAudio('Open', [], [], 1, [], 1);
end
tmp_s = PsychPortAudio('GetStatus',ptb.audio_port);
ptb.audio_sampling = tmp_s.SampleRate;

%% Clean
data_clear;
