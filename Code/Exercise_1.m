%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Exercise 1
% 1. Generate a parallelepiped mesh
% 2. Plot the mesh.
% 3. Set and run the simulation
% 4. Plot the fluenceCW in the volume and look at the section at x = 0
% 5. Plot the fluence in time-domain
% 6. Place a detector and pick-up the fluence value
% 7. Plot photon trajectories
%
% Author: Andrea Farina/Giovanna Tramontin Polimi/CNR         October 2024
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clearvars;
close all;
%% 1. Generate a piped mesh
% corners of the mesh
p0 = [-30, -30, 0];
p1 = [30, 30, 30];

% generate the mesh
[node, face, elem] = meshabox(p0, p1, 1);

%% 2. Plot the mesh


%% 3. Set and run the simulation
% optical properties
mua = 0.01;             % absorption coefficient [mm-1]
mus = 1.0;              % scattering coefficient [mm-1]
g = 0.8;                  % anisotropy factor
n = 1.4;                % refractive index
musp = mus * (1 - g);   % reduced scattering coefficient [mm-1]

% set the cfg structure
cfg.node = node;
cfg.elem = elem;

% set the number of photons
cfg.nphoton = 1e6;      % number of pohoton to lunch      

% set optical properties

% set the source

% set the temporal data

% output data are on the nodes

% set homogeneous optical properties

% run the simulation

% calculate the CW fluence summing over the time dimension

%% 4. Plot CW fluence


%% 5. plot TD flux fluence


%% 6. Place a detector and pick-up the fluence value

%find the nearest node to the detector

% pick-up fluence at the identified node

%% 7. Plot photon trajectories
NtrajPlot = 10;
PlotPhotonTrajecetories(traj,NtrajPlot,p0,p1);




