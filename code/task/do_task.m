
%% TASK
while ~index.endtask && ~index.escape
    %% SESSION
    % set session
    set_session;
    % task screen
    screen_break;
    screen_session;
    % do session
    do_session;
    
    %% END OF TASK
    set_endoftask;
end
