
function y = sign2bin(x)
    % convert signed to binary
    y               = ones(size(x));
    y(x(:)==-1)     = 0;
    y(isnan(x(:)))  = nan;
end
