%% THIS FUNCTION COMPUTES THE PROSPECT THEORY UTILITY OF A GAMBLE
% GIVEN THE TASK FEATURES IN JUECHEMS ET AL (2016) 
% more specifically, it computes the probability to gamble given 
% a set of parameters, gains, losses, probabilities, and the last
% outcomes, thus computing wealth-dependent utility

function prob_gamble = simulation_PT_utility(params,task)

gamble_utility = get_utility();
prob_gamble = sigmoid([params(4),params(5)],gamble_utility);

    function gamble_utility = get_utility()
                
        % Parameter
        alpha   = params(1);
        lambda  = params(2);
        gamma   = params(3);
        
        % Trial variables
        loss = task.loss;
        gain = task.wins;
        prob = task.prob;
        cumu = task.cumu;
        
        % UPDATE ALPHA AS FUNCTION OF CUMU
        alpha = alpha + params(6) * cumu;
        
        gamble_utility = get_pt_prob(prob,gamma) .* get_pt_gain_utility(gain,alpha)...   % Gains
                       + get_pt_prob((1-prob),gamma) .* get_pt_loss_utility(loss,alpha,lambda); % Losses
        gamble_utility = gamble_utility - get_pt_loss_utility(-0.1*ones(size(gain)),alpha,lambda);
        
    end
end