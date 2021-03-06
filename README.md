# Tularemia
The Tularemia Repository contains a sequence of MATLAB scripts/LiveScripts that iteratively demonstrate how to collect and analyze data as part of a simple scientific experimentation / hypothesis testing example.

**Tularemia1.mlx:** is a MATLAB LiveScript that loads an external data file into an array, computes descriptive statistics of the data (including several measures of central tendency, variability, asymmetry, and the importance of outliers), and produces several visualizations of the data including histograms and box and whisker plots.

**Tularemia1.m:** is a MATLAB script that has the same functionality as Tularemia1.mlx.

**Tularemia2.mlx:** is a MATLAB LiveScript that performs the same functionality as Tularemia1.mlx, but it also fits a distribution to the control data using parameter estimation and performs some elementary assessments on the fit.

**Tularemia2.m:** is a MATLAB script that has the same functionality as Tularemia2.mlx.

**Tularemia3.mlx:** is a MATLAB LiveScript that performs the same functionality as Tularemia2.mlx, but it continues to assess the fit of the distribution to the control data using Pearson's goodness of fit test. In addition, it loads a small set of experimental data and applies Fisher's significance testing to the task of determining if the experimental data is significantly different from what the model distribution leads us to expect and if the mean of the experimental data is significantly different from the theoretical mean of the model distribution.

**Tularemia3.m:** is a MATLAB script that has the same functionality as Tularemia3.mlx.

**DataExample.csv:** csv file containing the control data for the experiment.

**ExperimentalDataExample.csv:** csv file containing the experimental data for the experiment.
