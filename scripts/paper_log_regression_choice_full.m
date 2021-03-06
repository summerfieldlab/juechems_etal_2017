%% Global settings
data.vb_prox = 1./data.vb_distance;
data.vb_risk = round(data.vb_risk,2);
dep_variable = 'resp_gamble';
options = {'binomial','link','logit'};
subjects = 1:20;
use = 1:7500;
%% Model 1
predictors      = { 'vb_ev',...
                    'vb_risk',...
                    'resp_valast1',...
                    'resp_cumu8',...
                    'resp_cumuval',...
                    'resp_cumutotal',...
                    'resp_galast1',...
                    'last_lottery',...
                    'vb_prox',...
                    'vb_distart',...
                    'exp_trial',...
                    'exp_session',...
                    'vb_framelngth'...
                    };
                
interactions    = {{'vb_risk','resp_cumuval'},...
                   {'vb_ev','resp_cumuval'},...
                   {'exp_session','resp_cumuval'},...
                   {'vb_ev','vb_prox'},...
                   {'vb_risk','vb_prox'}...
                   };

legend          = horzcat(  predictors,...
                            'RXC',...
                            'EVxC',...
                            'SxC',...
                            'EVxProx',...
                            'RiskxProx'...
                          );

[B, DEV, STAT]   = glm_wrapper(options,data,dep_variable,predictors,subjects,interactions,use);
% This one creates the plot. It's a custom function, so it has some
% settings, which you would need to change within it or by using
% set(gca,...) later. 
[~, h]           = errorplot(B(subjects,2:end),legend,'axis');
[~,p,~,t]        = ttest(B(subjects,2:end),0);
fprintf('\n%-20s \tT-Values: \t P-values \t\n\n','Regressor');
for i = 1:size(t.tstat,2)
    fprintf('%-20s \t %-+2.4f \t %2.4f\n',legend{i},t.tstat(i),p(i));
end
