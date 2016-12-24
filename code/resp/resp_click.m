
%% Press click
% initialise
down = 0;
% press
while ~down || ~any(code(KbName('Return')))
    [down,secs,code] = KbCheck();
end

%% Release click
% release
while down
    [down,secs,code] = KbCheck();
end

%% Clean
clear down secs code;
