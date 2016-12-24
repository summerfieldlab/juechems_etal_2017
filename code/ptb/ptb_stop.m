 
%% Time
ptb.time_stop = GetSecs;

%% Screen

% mouse
ShowCursor;

% remove anything pressed during the experiment (?)
FlushEvents;

% window
Screen('CloseAll');

%% Audio

% stop sound
try
    PsychPortAudio('Close', ptb.audio_port);
    ptb.audio_port = [];
end
