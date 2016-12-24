%% Split of cumulative at median
%  Compare shift and slope

% PARAMETERS
use_subs = 1:20;
resp = ~isnan(data.resp_gamble);
low_med = data.resp_cumu_median_logical == -1;
high_med= data.resp_cumu_median_logical == 1;
init_beta = [0 1];
betas_below = zeros(20,2);
betas_above = zeros(20,2);

% Estimation
for i = use_subs
    use_trials = data.exp_subject == i & resp;
    % Low cumu
    ev_below =  use_trials & low_med;
    ev_below = jb_getvector(data.resp_gamble(ev_below),data.vb_ev(ev_below));
    betas_below(i,:) = nlinfit(unique(data.vb_ev),ev_below,@sigmoid,init_beta);
    % High cumu
    ev_above =  use_trials & high_med;
    ev_above = jb_getvector(data.resp_gamble(ev_above),data.vb_ev(ev_above));
    betas_above(i,:) = nlinfit(unique(data.vb_ev),ev_above,@sigmoid,init_beta);
end

p = signrank(betas_below(use_subs,1),betas_above(use_subs,1));
fprintf('Wilcoxon signed rank for shift: %1.5f\n',p);
p = signrank(betas_below(use_subs,2),betas_above(use_subs,2));
fprintf('Wilcoxon signed rank for slope: %1.5f\n',p);

% PLOT FIGURE 1e
grey  = [0.25 0.25 0.25];
h = figure;
h.Color = [1 1 1];
sc = scatter(betas_above(use_subs,1) - betas_below(use_subs,1),betas_above(use_subs,2) - betas_below(use_subs,2));
ylim([-4.5 2.5])
xlim([-0.3 0.6])
line([0 0],[-4.5 4.5],'Color',[0 0 0],'LineWidth',1.5);
line([-0.3 0.75],[0 0],'Color',[0 0 0],'LineWidth',1.5);
sc.MarkerFaceColor = grey;
sc.MarkerEdgeColor = grey;
sc.SizeData = 40;
sc.CData = [0 0 1];
a = gca;
a.FontName = 'Helvetiva';
a.FontSize = 15;
a.LineWidth = 2;
a.Box = 'off';

    
    