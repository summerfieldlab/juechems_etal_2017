
function e = tools_index(v,i)
    e = nan;
    if i>0; e = v(i);       end
    if i<0; e = v(end+i);   end  
    if  ~i; e = v(end);     end
end
