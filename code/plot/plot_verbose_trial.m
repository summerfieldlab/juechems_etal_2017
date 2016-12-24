
%% verbose
if parameters.flag_verbose
    fprintf('\n');
    fprintf('win         %.2f \n',data.vb_wins(index.trial));
    fprintf('loss        %.2f \n',data.vb_loss(index.trial));
    fprintf('probability %.2f \n',data.vb_prob(index.trial));
end
