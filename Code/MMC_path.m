MCXSTUDIO_PATH = '/Users/andreafarina/Documents/Politecnico/Code/MCXStudio';
ISO2MESH_PATH = '/Users/andreafarina/Documents/Politecnico/Code/iso2mesh_GitHub';
%%
addpath(genpath(ISO2MESH_PATH)); %% add subfolder

run([MCXSTUDIO_PATH,filesep,'mcxsuite_addpath.m']);