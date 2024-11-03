function [tpsf,newtime] = HistogramTPSF(w,time,path,c0,n)
% HISTOGRAMTPSF.m Generate histogram of the TPSF
% Input:
%       w:      photon weights  
%       time:   edges of the time bins: [time(1),time(2)], [time(2), time(3)], etc...
%                                        | 1st bin | ----   | 2nd bin |  
%       path:   photon paths
%       c0:     speed of light in vacuum (unit path / unit time)
%       n:      refractive index
% Output:
%        tpsf:  tpsf value at each time bin
%        ntime: new temporal points calculated as average time for each bin
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 


tpsf = 
newtime = time(1:end-1) + dt/2;
end