
if data.vb_distance(index.trial)==1
    i_frame = data.vb_frame(index.trial);
    
    %% set bonus
    ii_frame = (data.vb_frame == i_frame);
    bonus    = sum(data.resp_value(ii_frame(1:length(data.resp_value))));
    index.bonus(end+1) = bonus;
    
    %% clean
    clear ii_frame bonus;
end
