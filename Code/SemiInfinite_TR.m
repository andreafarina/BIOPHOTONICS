function tpsf = SemiInfinite_TR(time,rho,mua,musp,c,n)
% SEMIINFINITE_TR.m Calculate the tpsf from a semi-infinite medium
% Input:
%       time:   time points (avoid zero)
%       rho:    source/detector distance
%       mua:    absorption coefficient (1/unit_rho)
%       musp:   reduced scattering coefficient (1/unit_rho)
%       c0:     speed of light in vacuum (unit rho / unit time)
%       n:      refractive index
% Output:
%        tpsf:  tpsf value at each time point
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

%% calculation of the Extrapolated Boundary Condition factor
n_ext = 1.00;
n_rel = n / n_ext;
if (n_rel<=1)
    A = 3.084635-6.531194*n_rel+8.357854*n_rel^2-5.082751*n_rel^3+1.171382*n_rel^4;
else
    A = 504.332889-2641.00214*n_rel+5923.699064*n_rel^2-7376.355814*n_rel^3+5507.53041*n_rel^4-2463.357945*n_rel^5+610.956547*n_rel^6-64.8047*n_rel^7;
end
%%
v =  

% isotropic source depth
z0 = 1/mus;

% diffusion coefficient
D = 1/(3*mus);

% extrapolated distance
ze = 2*A*D;

% insert here the core of the calculation

end

