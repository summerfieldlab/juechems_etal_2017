%% RETURNS THE BEHAVIOURAL RESULTS FOR THE PAPER

% data = load_data_ext('scanner');

% GAMBLE AND RT MEANS
use = ~isnan(data.resp_gamble);
m = jb_getvector(data.resp_gamble(use),data.exp_subject(use));

fprintf('\nMean gamble: %2.2f\t SD: %2.2f\n',100*mean(m),100*std(m)); 

m = jb_getvector(data.resp_rt(use),data.exp_subject(use));
fprintf('\nMean RT: %2.2fms\t SD: %2.2fms\n',1000*mean(m),1000*std(m));

%% LOG REGRESSION CHOICE

paper_log_regression_choice_full;

paper_log_regression_choice_reduced;

%% SIGMOID HIGH VERSUS LOW CUMU

paper_cumu_high_vs_low;