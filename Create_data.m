function N = Create_data( time, N0, k, gamma )

% This function returns datasets based on the solution of a rate
% equation with a monomolecular decay term + a bimolecular decay term (+ noise).
% Rate equation: N' = -k*N - gamma*N^2.
% Analytical solution: N = N0*exp(-k*t)./(1+gamma/k*N0*(1-exp(-k*t))).

% "time" and "N0" are raw arrays. 

% Created-by: Silvina <silvinanorma@gmail.com>

rng default % for reproducibility
noise = rand(size(N0,2),size(time,2));
N = NaN(size(N0,2),size(time,2));
N = N0'*exp(-k*time)./(1+gamma/k*N0'*(1-exp(-k*time))) + noise;

end

