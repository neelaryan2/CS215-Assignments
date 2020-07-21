function newMedian = UpdateMedian (oldMedian, NewDataValue, A, n)
if rem(n,2) == 1
   k = (n + 1) / 2;
   if NewDataValue > A(k+1)
       newMedian = (oldMedian + A(k+1))/2;
   elseif NewDataValue < A(k-1)
       newMedian = (oldMedian + A(k-1))/2;
   else
       newMedian = (oldMedian + NewDataValue)/2;
   end
else
    k = n / 2;
    if NewDataValue >= A(k+1)
       newMedian = A(k+1);
   elseif NewDataValue <= A(k)
       newMedian = A(k);
   else
       newMedian = NewDataValue;
    end
end
end