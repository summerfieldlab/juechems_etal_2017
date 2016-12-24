
n_frame = parameters.frame_number;
u_frame   = zeros(1,n_frame+1);

%% set frame
while   any(diff(u_frame) < parameters.frame_proprange(1)*parameters.task_nbtrials/parameters.frame_number)  || ...
        any(diff(u_frame) > parameters.frame_proprange(2)*parameters.task_nbtrials/parameters.frame_number)
        
    u_frame(1)       = 1;
    u_frame(2:end-1) = sort(randi(parameters.task_nbtrials,1,n_frame-1));
    u_frame(end)     = parameters.task_nbtrials+1;
    
end
    
%% set data
data.vb_frame     = zeros(1,parameters.task_nbtrials);
data.vb_distance  = zeros(1,parameters.task_nbtrials);
for i_frame = 1:n_frame
    data.vb_frame(    u_frame(i_frame) : u_frame(i_frame+1)-1) = i_frame;
    data.vb_distance( u_frame(i_frame) : u_frame(i_frame+1)-1) = (u_frame(i_frame+1)-u_frame(i_frame)):-1:1;
end
data.vb_distoend  = (parameters.task_nbtrials:-1:1);

%% clean
clear n_frame u_frame i_frame;