%% PERFORMS A Z-TRANSFORMATION ON A VECTOR
function z = ztransf(x)
    z = (x - nanmean(x)) ./ nanstd(x);
end
