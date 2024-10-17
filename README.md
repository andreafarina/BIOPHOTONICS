# BIOPHOTONICS
Material for the Monte Carlo laboratory of the course "Biophotonics" held in the Physics Engineering course @ Politecnico di Milano, Italy.
The laboratory requires a working installation of the _"Monte Carlo Extreme"_ software in particular the Mesh-Based Monte Carlo (MMC).
You can download this software here: http://mcx.space.
## Installation instructions for MMC
1. Go to the Nightly-Build section http://mcx.space/nightly/
2. Select the folder with your platform: Windows, Linux, Apple.
3. Download the package
   ```MCXStudio-[your platform]-nightlybuild.zip``` and extract it in a folder on your disk.
5. If you download the Apple version you have to download also ```mmc-[your platform]-nightlybuild.zip``` and ```mmclab-[your platform]-nightlybuild.zip``` and copy the extracted folder so that to have the following folder tree:
```
MCXStudio/
  |-  MCXSuite/
  |      |- mmc
  |-  MATLAB/
  |      |- mmclab
```
## Installation instructions for iso2Mesh
To generate the meshes you need to install the software iso2mesh. You can find it in the following repository: https://github.com/fangq/iso2mesh. You only need to download it or clone the repository in one folder on your disk.
## Post-installation operations
1. Run the file ```mcxsuite_addpath.m``` to set the path of MMC and add the path of the ```iso2mesh``` installation. To add the path in MATLAB you can do one of the following steps:
   1. Add permanently to the MATLAB path through the **Set Path** button.
   2. Add the following lines on top of your scripts:
      ```matlab
      ISO2MESH_PATH = path_to_iso2mesh;
      addpath(genpath(ISO2MESH_PATH));
      ```
## Test the installation
Run some example files in the folder ```MCXStudio/MATLAB/mmclab/example```, in particular:
* ```demo_mmclab_basic.m```
* ```demo_example_validation.m```
* ```demo_sfdi_2layer.m```

Don't care about the output, just test if those examples run without error.


