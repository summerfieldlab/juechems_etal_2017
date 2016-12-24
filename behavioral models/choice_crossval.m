%% Function to fit parameters in a cross-validated fashion

function [params,fits] = choice_crossval(varargin)

% CHECKS
if  length(varargin) < 1;    error('You have not specified data.\n');
elseif  length(varargin) < 2;    error('You have not specified the subject.\n');
elseif  length(varargin) < 3;    error('You have not specified the model.\n');
elseif  length(varargin) < 4;    error('You have not specified the initial parameters.\n');
elseif  length(varargin) < 5;    error('You have not specified whether to use cross-validation.\n');
elseif  length(varargin) < 6;    error('You have not specified the number of iterations.\n');
end

% INIT
data = varargin{1};
sub  = varargin{2};
model= varargin{3};
init_params = varargin{4};
crossval = varargin{5};
n_Iter = varargin{6};
if length(varargin) == 7; flag = varargin{7};
else flag = 'anneal';
end

% SETTINGS
switch model
    case 'pt_zero'
        params = nan(max(data.exp_session),5);
    case 'pt_update'
        params = nan(max(data.exp_session),6);
    case 'pt_cumu'
        params = nan(max(data.exp_session),5);
    case 'pt_power'
        params = nan(max(data.exp_session),6);
    case 'pt_lambda'
        params = nan(max(data.exp_session),6);
    case 'pt_gamma'
        params = nan(max(data.exp_session),6);
    case 'pt_cumuews'
        params = nan(max(data.exp_session),6);
    case 'pt_aspiration'
        params = nan(max(data.exp_session),6);
end
fits = nan(5,1);

% FUNCTION CODE
fprintf('\n Estimating subject %d with model %s\n',sub,model);
if crossval == 1
    for cval = 1:max(data.exp_session)
        sessions = data.exp_session ~= cval;
        use      = sessions & data.exp_subject == sub;
        switch model
            case 'pt_zero'
                [params(cval,:),fits(cval)] = cval_ptzero(data,use,sub,flag,init_params,[0 0 0 -1 0],[5 5 5 1 20],crossval,n_Iter);
            case 'pt_update'
                [params(cval,:),fits(cval)] = cval_ptupdate(data,use,sub,flag,init_params,[0 0 0 -1 0 -1],[5 5 5 1 20 1],crossval,n_Iter);
            case 'pt_cumu'
                [params(cval,:),fits(cval)] = cval_ptcumu(data,use,sub,flag,init_params,[0 0 0 -1 0],[5 5 5 1 20],crossval,n_Iter);
            case 'pt_cumuews'
                [params(cval,:),fits(cval)] = cval_ptcumuews(data,use,sub,flag,init_params,[0 0 0 -1 0 0],[5 5 5 1 20 1],crossval,n_Iter);
            case 'pt_power'
                [params(cval,:),fits(cval)] = cval_ptpower(data,use,sub,flag,init_params,[0 0 0 -1 0 -10],[5 5 5 1 20 10],crossval,n_Iter);
            case 'pt_lambda'
                [params(cval,:),fits(cval)] = cval_ptlambda(data,use,sub,flag,init_params,[0 0 0 -1 0 -10],[5 5 5 1 20 10],crossval,n_Iter);
            case 'pt_gamma'
                [params(cval,:),fits(cval)] = cval_ptgamma(data,use,sub,flag,init_params,[0 0 0 -1 0 -10],[5 5 5 1 20 10],crossval,n_Iter);
            case 'pt_aspiration'
                [params(cval,:),fits(cval)] = cval_pt_aspiration(data,use,sub,flag,init_params,[0 0 0 -1 0 -10],[5 5 5 1 20 10],crossval,n_Iter);
        end
    end
else
    cval = 1;
    use      = data.exp_subject == sub;
    switch model
        case 'pt_zero'
            [params(cval,:),fits(cval)] = cval_ptzero(data,use,sub,flag,init_params,[0 0 0 -1 0],[5 5 5 1 20],crossval,n_Iter);
        case 'pt_update'
            [params(cval,:),fits(cval)] = cval_ptupdate(data,use,sub,flag,init_params,[0 0 0 -1 0 -1],[5 5 5 1 20 1],crossval,n_Iter);
        case 'pt_cumu'
            [params(cval,:),fits(cval)] = cval_ptcumu(data,use,sub,flag,init_params,[0 0 0 -1 0],[5 5 5 1 20],crossval,n_Iter);
        case 'pt_cumuews'
            [params(cval,:),fits(cval)] = cval_ptcumuews(data,use,sub,flag,init_params,[0 0 0 -1 0 0],[5 5 5 1 20 1],crossval,n_Iter);
        case 'pt_power'
            [params(cval,:),fits(cval)] = cval_ptpower(data,use,sub,flag,init_params,[0 0 0 -1 0 -10],[5 5 5 1 20 10],crossval,n_Iter);
        case 'pt_lambda'
            [params(cval,:),fits(cval)] = cval_ptlambda(data,use,sub,flag,init_params,[0 0 0 -1 0 -10],[5 5 5 1 20 10],crossval,n_Iter);
        case 'pt_gamma'
            [params(cval,:),fits(cval)] = cval_ptgamma(data,use,sub,flag,init_params,[0 0 0 -1 0 -10],[5 5 5 1 20 10],crossval,n_Iter);
        case 'pt_aspiration'
            [params(cval,:),fits(cval)] = cval_pt_aspiration(data,use,sub,flag,init_params,[0 0 0 -1 0 0],[5 5 5 1 20 10],crossval,n_Iter);
    end
end
end
