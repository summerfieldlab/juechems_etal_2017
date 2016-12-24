
function y = bin2sign(x)
    % convert binary to signed
    y               = ones(size(x));
    y(x(:)==0)      = -1;
    y(isnan(x(:)))  = nan;
end
