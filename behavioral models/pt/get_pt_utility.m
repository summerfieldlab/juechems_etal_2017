function util = get_pt_utility(value,params)

ind_neg = value < 0;

util(ind_neg) = get_pt_loss_utility(value(ind_neg),params(1),params(2));
util(~ind_neg) = get_pt_gain_utility(value(~ind_neg),params(1));

end