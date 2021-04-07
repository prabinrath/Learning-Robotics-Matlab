function ind = search_index(arr,val)
    thresh = (arr(end)-arr(1))/(size(arr, 2)-1);
    if val<arr(1) || val>arr(end)
        disp("Out of bound interpolation");
        ind = -1;
    else
        ind = BS(arr, 1, size(arr, 2), val, thresh);
    end
end

function ind = BS(arr, i, j, val, thresh)
    if i<j        
        pivot = floor((i+j)/2);
        if arr(i)<=val && arr(j)>=val && abs(arr(j)-arr(i)-thresh) < 1e-10
            % disp("found");
            ind = i;
        elseif arr(pivot)<=val
            % disp("lower bound");
            ind = BS(arr, pivot, j, val, thresh);
        elseif arr(pivot)>=val
            % disp("upper bound");
            ind = BS(arr, i, pivot, val, thresh);
        end
    end
end