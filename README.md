# SLFS
This repository contains all R and MATLAB code required to verify all results in Strömbom et al. Modeling hum... . Submitted. In particular, it contains the code and materials needed to

- Recreate all the maps presented in the paper (Figures 1,2,3) from the data used in the paper.
- Re-perform the complete statistical analyses used to support the results in the paper and Table 1 and Figure 4.
- Verify the modeling results presented in the paper, and modify and extend the model. You can also use this to regenerate Figure 5.


1. TO RECREATE ALL THE MAPS IN THE PAPER

Download all files in the Maps folder. Then open the slfs_maps.Rproj and run the files to create the maps from the relevant data.

2. RE-PERFORM THE STATISTICAL ANALYSIS

Download all files in the Statistics folder. Then Open the slfs_statistical_analysis.Rproj and run the files to perform the statistical analyses and generate Table 1 and Figure 4.

3. HOW TO VERIFY THE SIMULATION RESULTS VIA NEW SIMULATIONS

Download all files from the Simulations folder.

To run new simulations for the 166 county model run the LabSLF166.m file. This will run 1000 simulations (of SLF166np.m) starting with Berks county as the only infested in 2014 up until 2021 and then calculate the proportion of simulations in which each county was infested in each year. The results will be saved in the pQ166.mat file. To see the results plotted as maps (Figure 3) and calculate matches and false negatives/positives import the pQ166.mat file and copy the numbers over to columns E-L in the ‘166 Region model’ tab in the supplementary Data and Maps.xlsx file. 

To run new simulations for the 581 county model run the LabSLF581.m file. This will run 1000 simulations (of SLF581np.m) starting with Berks county as the only infested in 2014 up until 2025 and then calculate the proportion of simulations in which each county was infested in each year. The results will be saved in the pQ581.mat file. To see the results plotted as maps (Figure 4) and calculate matches and false negatives/positives import the pQ581.mat file and copy the numbers over to columns E-P in the ‘581 Region model’ tab in the supplementary Data and Maps.xlsx file. 

You can also recreate Figure 5 by running the mkFig5.m file.

We have run all code on MATLAB 2016b and 2021a without any problems.

