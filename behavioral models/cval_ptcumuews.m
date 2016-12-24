%% FUNCTION TO EVALUATE THE PT MODEL WITH CUMU AS REFERENCE POINT AND EXPONENTIALLY WEIGHTED SUM

function [params,fit] = cval_ptcumuews(data,use,sub,flag,init_params,bnd_low,bnd_up,crossval,n_Iter)

switch flag
    case 'anneal'
        init = rand(n_Iter,6);
        init = init .* repmat(bnd_up - bnd_low,n_Iter,1) + repmat(bnd_low,n_Iter,1);
        for i=1:n_Iter
            this_params = init(i,:);
            [params(i,:),fit(i)] = simulannealbnd(@log_likelihood,this_params,bnd_low,bnd_up);
        end
        [~,best] = min(fit);
        fit = fit(best);
        params = params(best,:);
    case 'fmin'
        p = nan(n_Iter,6);
        f = nan(n_Iter,1);
        init = rand(n_Iter,6);
        init = init .* repmat(bnd_up - bnd_low,n_Iter,1) + repmat(bnd_low,n_Iter,1);
        for i=1:n_Iter
            [p(i,:),f(i)] = fmincon(@log_likelihood,init(i,:),[],[],[],[],bnd_low,bnd_up);
        end
        [~,best] = min(f);
        params = p(best,:);
        fit = f(best);
end

if crossval
    use = data.exp_subject == sub & ~use;
    fit = log_likelihood(params);
end

% LOG LIKELIHOOD FUNCTION
    function log_l = log_likelihood(parms)
        p_gamble = get_p_gamble(parms);
        decision    = data.resp_gamble(use);
        omit        = isnan(data.resp_gamble(use));
        p_gamble(p_gamble < 0.0000001) = 0.0000001;
        p_gamble(p_gamble > 0.9999999) = 0.9999999;
        likelihood  = decision(~omit) .* log(p_gamble(~omit)) + (1-decision(~omit)) .* log(1-p_gamble(~omit));
        log_l = sum(likelihood);
        log_l = -log_l;      
    end

%% GET PREDICTED VALUES 
    function [prob_gamble, gamble_utility] = get_p_gamble(parms)       
    
        cumu = ew_cumu(data.resp_cumuval(use),data.exp_first(use),parms(6));
        gamble_utility = get_utility(parms(1:3),cumu);
        reject_utility(cumu >= 0.1) = get_pt_gain_utility(cumu(cumu>=0.1) - 0.1,parms(1));
        reject_utility(cumu < 0.1) = get_pt_loss_utility(cumu(cumu<0.1) - 0.1,parms(1),parms(2));
        gamble_utility = gamble_utility - reject_utility;
        
        prob_gamble = sigmoid([parms(4),parms(5)],gamble_utility);

    end

    function gamble_utility = get_utility(parms,cumu)    
        
        % Parameter
        alpha   = parms(1);
        lambda  = parms(2);
        gamma   = parms(3);
        
        % Trial variables
        loss = data.vb_loss(use);
        gain = data.vb_wins(use);
        prob = data.vb_prob(use);

        gamble_utility = get_pt_prob(prob,gamma) .* get_pt_utility(gain + cumu,[alpha,lambda])...   % Gains
                       + (get_pt_prob(1-prob,gamma)) .* get_pt_utility(loss + cumu,[alpha,lambda]); % Losses
        
    end

end