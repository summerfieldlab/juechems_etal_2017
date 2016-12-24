
index = struct();

%% index
disp('Index')

% subject
index.subject = nan;
while isnan(index.subject) || index.subject<0 || index.subject>999
    index.subject = str2double(input('  Id : ','s'));
end

% index
index.session    = 0;
index.trial      = 0;

% end
index.endtask    = 0;
index.endsession = 0;

% escape
index.escape     = 0;

% trigger
index.gs_trigger = nan;

% bonus
index.bonus    = [];
index.gs_bonus = [];

index.lottery    = [];
index.gs_lottery = [];
