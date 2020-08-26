function newmean = updateMean(oldmean,newDataVal,N)
% N is the index of the new data item!
newmean = oldmean + (newDataVal-oldmean)/N;