
function mkdirp(path)
    if path(end)==filesep(); path(end)=[];                  end
    i_filesep = find(path==filesep(),1,'last');
    rootpath = path;
    rootpath(i_filesep:end) = [];
    if ~exist(rootpath,'dir'); mkdirp(rootpath); end
    if exist(path,'dir'); return; end
    mkdir(path);
end

