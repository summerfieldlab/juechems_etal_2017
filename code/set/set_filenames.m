
if ~parameters.flag_debug
    participant.filename_data  = sprintf('data%sdata%sdata_%03i_%d.mat', filesep,filesep,index.subject,index.session);
    participant.filename_error = sprintf('data%sdata%serror_%03i_%d.mat',filesep,filesep,index.subject,index.session);
    if exist(participant.filename_data,'file')
        error('set_participant: error. data file already exists');
    end
    if exist(participant.filename_error,'file')
        error('set_participant: error. error file already exists');
    end
end
