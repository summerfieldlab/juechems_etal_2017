
%% participant info
disp('Participant')
participant = struct();

if ~parameters.flag_debug
    participant.age  = input('  Age:      ','s');
    participant.sex  = input('  Sex:      ','s');
    participant.hand = input('  Hand:     ','s');
else
    participant.age  = '';
    participant.sex  = '';
    participant.hand = '';
end
