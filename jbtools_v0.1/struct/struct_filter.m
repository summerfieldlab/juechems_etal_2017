
function z = struct_filter(s,ii)

    u_field = fieldnames(s);
    n_field = length(u_field);
    for i_field = 1:n_field
        field = u_field{i_field};
        z.(field) = s.(field)(ii);
    end
    
end