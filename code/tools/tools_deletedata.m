function tools_deletedata()

    %% sure?
    sure = str2num(input('You sure? ','s'));
    if length(sure)~=1 || sure~=1
        fprintf('cancelled\n\n');
        return;
    end
    fprintf('\n');

    %% donefiles
    delete('data/data/*');

end