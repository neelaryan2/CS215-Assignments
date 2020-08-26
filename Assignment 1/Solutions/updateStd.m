function newstd = updateStd(oldmean,newmean,oldstd,newDataVal,N)
% N is the index of the new data item
newstd = sqrt(oldstd^2*(N-2)/(N-1)+(newmean-oldmean)^2 + ((newmean-newDataVal)^2)/(N-1));