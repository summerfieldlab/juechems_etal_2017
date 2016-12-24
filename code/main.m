%{
    notes:
      requires PsychToolbox (http://psychtoolbox.org/HomePage)

    ADD WAIT IN screen_trial
    PARAMETERS.TIME_TRIAL =  2.0;

%}

clear all;

%% SET
set_parameters;
set_index;
set_participant;
set_keys;

%% EXPERIMENT
try
    %% START
    % initialise psychtoolbox
    ptb_start;
    % show introduction screen
    screen_intro;
    
    %% TASK
    % task screen
    screen_task;
    % set task
    set_task;
    % do task
    do_task;
    
    %% END
    % show end screen
    screen_end;
    % close psychtoolbox
    ptb_stop;
    % clean
    data_clear;
    
catch err
    % close psychtoolbox
    ptb_stop;
    % save data
    data_error;
    % rethrow error
    rethrow(err);
end
