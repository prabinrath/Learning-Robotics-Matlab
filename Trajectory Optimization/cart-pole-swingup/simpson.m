function val = simpson(times, x)
    sum = 0;
    j = 1;
    for i = 1:size(times, 2)-1
        dt = times(i+1) - times(i);
        sum = sum + (dt/6)*(x(j)+4*x(j+1)+x(j+2));
        j = j+2;
    end
    val = sum;
end

