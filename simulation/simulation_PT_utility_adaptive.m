%% THIS FUNCTION COMPUTES THE PROSPECT THEORY UTILITY OF A GAMBLE
% GIVEN THE TASK FEATURES IN JUECHEMS ET AL (2016) 
% more specifically, it computes the probability to gamble given 
% a set of parameters, gains, losses, probabilities, and the last
% outcomes, thus computing wealth-dependent utility as given by the
% adaptive gain model

function prob_gamble = simulation_PT_utility_adaptive(params,task)

shifts = params(4) + params(6) * task.cumu;
slopes = ones(size(shifts)) * params(5);

gamble_utility = get_utility();
prob_gamble = sigmoid([shifts',slopes'],gamble_utility');
prob_gamble = prob_gamble';

    function gamble_utility = get_utility()
                
        % Parameter
        alpha   = params(1);
        lambda  = params(2);
        gamma   = params(3);
        
        % Trial variables
        loss = task.loss;
        gain = task.wins;
        prob = task.prob;
        
        gamble_utility = get_pt_prob(prob,gamma) .* get_pt_gain_utility(gain,alpha)...   % Gains
                       + get_pt_prob((1-prob),gamma) .* get_pt_loss_utility(loss,alpha,lambda); % Losses
        gamble_utility = gamble_utility - get_pt_loss_utility(-0.1*ones(size(gain)),alpha,lambda);
    end
end