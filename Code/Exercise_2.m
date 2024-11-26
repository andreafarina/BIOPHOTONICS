%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Exercise 2
% 1. Generate a parallelepiped mesh
% 2. Plot the mesh.
% 3. Set and run the simulation
% 4. Get photon data and create the histogram
% 5. Compare with analytical model
%
% Author: Andrea Farina/Giovanna Tramontin Polimi/CNR         October 2024
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clearvars;
close all;
%% 1. Generate a piped mesh
% corners of the mesh
p0 = [-30, -30, 0] * 2;
p1 = [30, 30, 50] * 2;

% generate the mesh
[node, face, elem] = meshabox(p0, p1, 100);

%% 2. Set and run the simulation
% optical properties
mua = 0.01;             % absorption coefficient [mm-1]
mus = 1.0;              % scattering coefficient [mm-1]
g = 0.;                  % anisotropy factor
n = 1.4;                % refractive index
musp = mus * (1 - g);   % reduced scattering coefficient [mm-1]

% set the cfg structure
cfg.node = node;
cfg.elem = elem;
cfg.nphoton = 1e7;      % number of pohoton to lunch      
cfg.prop = [0,      0,      1,      1;      % external layer 
            mua,   mus,    g,       n];

% set the source
cfg.srcpos = [0., 0., 0];
cfg.srctype = 'pencil';
cfg.srcdir = [0 0 1];

% NEW! Set a detector: the detector is a shpere of radius rad and center at
% xd,yd,zd. You can set more than one detector. Each row of cfg.detpos
% corresponds to a detector.
rad = 2;            
cfg.detpos = [20, 0, 0, rad;
              0, 20, 0, rad];
               
% set the temporal data
cfg.tstart = 0;
cfg.tend = 5e-9;
cfg.tstep = 1e-10;
% output data are on the nodes
cfg.method = 'elem';

% set homogeneous optical properties
cfg.elemprop = ones(length(elem),1);

% run the simulation
[fluence,detp] = mmclab(cfg);

%% construct the TPSF from photon data and compare it with diffusion approximation
% calculate weights
mua = 0.01;
w = exp(-mua * detp.ppath);
dt = 10; % ps
tgrid = (cfg.tstart*1e12:dt:cfg.tend*1e12); %in ps
c0 = 0.3;   %mm/ps
% bin to generate the photon time-of-flight histogram
% Implement the function HistogramTPSF.m
% hint: use histcounts and accumarray functions
[tpsf,newtime] = HistogramTPSF(w,tgrid,detp.ppath,c0,n);
% normalize: to get the dimensions in W/cm^2 /ps you have to divide
% by the number of photon launched, by the detector surface, by dt
Adet = 2 * pi * rad^2;
tpsf = tpsf./(Adet*cfg.nphoton*dt);
%return;
% Compare with the Diffusion Approximation
% Implement the function SemiInfinite_TR.m
rho = 20;
Rifle = SemiInfinite_TR(newtime,rho,mua,musp,c0,n);

%plot the two curves
figure(6),semilogy(newtime,[tpsf,Rifle']),xlabel('time [ps]'), ylabel('fluence rate [1/(mm^2 * ps)]'),
ylim(max(Rifle(:)) * [1e-4 1.1]),legend('MC','DE')

