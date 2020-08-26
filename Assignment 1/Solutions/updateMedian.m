function newMedian = updateMedian(A,oldMedian,n,newValue)

% the following line needs to be replaced by an efficient routine which 
% inserts newValue into the correct place in A.
A = sort([A newValue]); 

if mod(n,2) == 1
    if newValue < oldMedian, 
        newMedian = [A(floor(n/2)+1) A(floor(n/2)+2)]; 
    else
        newMedian = [A((n+1)/2) A((n+1)/2+1)]; 
    end
else
    if newValue > oldMedian(1) && newValue < oldMedian(2)
        newMedian = newValue;
    elseif newValue < oldMedian(1), 
        newMedian = oldMedian(1); 
    elseif newValue > oldMedian(2), 
        newMedian = oldMedian(2); 
    end   
end
