if index.escape; return; end
if ~parameters.flag_audio, return; end

% create pitch array
tmp_iymax = round(ptb.audio_duration*ptb.audio_sampling);
tmp_y = sin(linspace(0,ptb.audio_duration*ptb.audio_freqlow,tmp_iymax));

% start the audioport
PsychPortAudio('FillBuffer',ptb.audio_port,tmp_y);
PsychPortAudio('Start',ptb.audio_port);

% clean
clear tmp_iymax tmp_y;