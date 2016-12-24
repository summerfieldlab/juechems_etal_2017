%% Last outcome

use = (~isnan(data.resp_gamble) & (~isnan(data.resp_galast1)) & (data.resp_valast1 ~= 0));
means = zeros(20,7);
errors= zeros(20,7);

for i = 1:20
    ii = use & data.exp_subject == i;
    [means(i,:) errors(i,:)] = jb_getvector(data.resp_gamble(ii),data.resp_valast1(ii));
end

figure; errorplot(means,{},'axis');
set(gca,...
    'FontName','Helvetica',...
    'FontSize',15,...
    'LineWidth',2,...
    'XTick',[1:7],...
    'XTickLabel',{});

title('Accept choices as function of last outcome');
xlabel('Outcome on previous trial');
ylabel('P(accept)');

% plot2svg('paper_last_outcome.svg');