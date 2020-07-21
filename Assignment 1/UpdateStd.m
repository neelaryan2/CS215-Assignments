function newStd = UpdateStd (OldMean, OldStd, NewMean, NewDataValue, n)
d = NewMean - OldMean;
t = NewDataValue - NewMean;
d = d * d;
t = t * t;
newStd = sqrt( ((n-1)*OldStd*OldStd + n*d + t)/n );
end
