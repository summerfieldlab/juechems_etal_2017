    function PT_loss_utility = get_pt_loss_utility(loss,beta,lambda)
        loss_utility = (-loss).^beta;
        PT_loss_utility = -lambda.*loss_utility;
    end