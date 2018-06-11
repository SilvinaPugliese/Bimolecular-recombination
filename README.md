# Bimolecular-recombination

This script globally fits a series of datasets with the following analytical function: N = N0*exp(-k*t)./(1+gamma/k*N0*(1-exp(-k*t))), which is the solution of the following rate equation: N' = -k*N - gamma*N^2 (monomolecular decay + bimolecular decay).
