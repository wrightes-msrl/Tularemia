%% Assessing the Occurrence of Tularemia in Cottontail Rabbits
%% Introduction
% This program has the following objectives:
%% 
% # Load an external data file into an array.
% # Compute descriptive statistics of the data. This will include several measures 
% of central tendency, variability, asymmetry, and the importance of outliers.
% # Produce several visualizations of the data including histograms and box 
% and whisker plots.
% # Fit a probability distribution to the data using parameter estimation.
% # Qualitatively assess the fit of the distribution to the data by comparing 
% the relative frequency histogram of the data set to a bar graph of the theoretical 
% distribution.
% # Quantitatively assess the fit of the distribution to the data by comparing 
% the empirical shape parameters of the data to the theoretical shape parameters 
% of the distribution
%% Initialization Code
% Clear all memory, close all figures, and clean out the command line history

clear all; close all; clc;
%% 
% Read a data set containing counts of rabbits diagnosed with tularemia out 
% of 40 different samples of size 30.

data=csvread('DataExample.csv')
%% Descriptive Statistics
% Compute some of the more useful descriptive statistics. 
% 
% The mean, median and mode are the three most commonly used measures of central 
% tendency.

Mean=mean(data)
Median=median(data)
Mode=mode(data)
%% 
% The three quartiles divide the sorted data set into four equal parts

q=quantile(data,[0.25 0.50 0.75])
%% 
% The maximum and minumum of the data set give us a measure of the extent covered 
% by our data set. We can, in turn, use these to find the range of our data set.

Minumum=min(data)
Maximum=max(data)
Range=Maximum-Minumum
%% 
% Variance and Standard Deviation are each measures of variability of the data 
% around its mean

Variance=var(data,1)
StdDev=std(data,1)
%% 
% Skewness is a measure of asymmetry around the mean and Bowley's measure for 
% skewness is a robust measure.

Skewness=skewness(data)
Bowley=(Q(3)+Q(1)-2*Q(2))/InterQuartileRange
%% 
% Kurtosis is a measure of the variability of the extremities of the dataset 
% about the mean.

Kurtosis=kurtosis(data)
%% Visualization
% Histogram
% A histogram gives us an overall picture of how our data is distributed. 

figure(1)
histogram(data,[-0.5:30.5])
title('Histogram');
xlabel('Number of Diseased Cottontail Rabbits in Sample of 30');
ylabel('Frequency of Observation');
xticks([0:2:30])
grid on
% Box and Whisker Plot
% A box and whisker plot is a good way to visually summarize some of the descriptive 
% statistics associated with our data set.  It also provides a visual measure 
% of variability.

figure(2)
boxplot(data)
title('Diseased Cottontail Data: Box and Whisker Plot');
% Empirical Distribution
% An empirical distribution is quite similar to a histogram, except that the 
% bar heights represent relative frequencies of each outcome in the data set rather 
% than absolute frequencies.

figure(3)
histogram(data,[-0.50:30.5],'Normalization','probability')
title('Empirical Distribution');
xlabel('Number of Diseased Cottontail Rabbits in Sample of 30');
ylabel('Probability of Outcomes')
xticks([0:2:30])
grid on
%% Parameter Estimation
% Mark and recapture with a marked group of K0=100 rabbits. Your approach should 
% just use the built in mle function. Unfortunately, this won't work with the 
% hypergeometric distribution, because it has discrete parameters. Instead, we 
% just use mark and recapture based upon the method of moments estimates.

K0=100;
n=30;
xcaptures=[3,0,2,4,1,1,4,2]; 
N=n*K0/mean(xcaptures); 
N=round(N);
K=mean(data)*N/n;
K=round(K);
% Theoretical Distribution
% Set the range of your random variable

x=0:30;
%% 
% Compute values of the theoretical distribution over this range

y=hygepdf(x,N,K,n);
%% 
% Plot the theoretical and empirical distributions together

figure(4)
histogram(data,[-0.5:30.5],'Normalization','pdf')
title('Empirical and Theoretical Distributions Compared \lambda');
xlabel('Number of Diseased Cottontail Rabbits in Sample of 30');
ylabel('Probability of Outcomes')
xticks([0:2:30])
grid on
hold on
bar(x,y,'FaceAlpha',0.65)
legend('Empirical','Theoretical')
hold off
% Theoretical Shape Parameters for the Hypergeometric Histribution

MEAN=n*K/N; 
VAR=(n*K/N)*((N-K)/N)*((N-n)/(N-1));
SKEWNESS=((N-2*K)*sqrt(N-1)*(N-2*n))/(sqrt(n*K*(N-K)*(N-n))*(N-2));
KURTOSIS=((N-1)*(N^2)*(N*(N+1)-6*K*(N-K)-6*n*(N-n))+6*n*K*(N-K)*(N-n)*(5*N-6))/(n*K*(N-K)*(N-n)*(N-2)*(N-3))+3;
shapes=array2table([MEAN VAR SKEWNESS KURTOSIS; Mean PopulationVariance Skewness Kurtosis],'VariableNames',{'Mean','Variance','Skewness','Kurtosis'},'RowNames',{'Theoretical','Empirical'})