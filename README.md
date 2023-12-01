# SLFS
Code for review of Strömbom et al. Modeling ... . Submitted to PLoSONE

HOW TO RUN NEW SIMULATIONS

Download all files from the Simulations folder.

To run new simulations for the 166 county model run the LabSLF166.m file. This will run 1000 simulations (of SLF166np.m) starting with Berks county as the only infested in 2014 up until 2021 and then calculate the proportion of simulations in which each county was infested in each year. The results will be saved in the pQ166.mat file. To see the results plotted as maps (Figure 3) and calculate matches and false negatives/positives import the pQ166.mat file and copy the numbers over to columns E-L in the ‘166 Region model’ tab in the supplementary Data and Maps.xlsx file. 

To run new simulations for the 581 county model run the LabSLF581.m file. This will run 1000 simulations (of SLF581np.m) starting with Berks county as the only infested in 2014 up until 2025 and then calculate the proportion of simulations in which each county was infested in each year. The results will be saved in the pQ581.mat file. To see the results plotted as maps (Figure 4) and calculate matches and false negatives/positives import the pQ581.mat file and copy the numbers over to columns E-P in the ‘581 Region model’ tab in the supplementary Data and Maps.xlsx file. 

You can also recreate Figure 5 by running the mkFig5.m file.

We have run all code on MATLAB 2016b and 2021a without any problems.


VERIFYING THE STATISTICAL ANALYSES 
