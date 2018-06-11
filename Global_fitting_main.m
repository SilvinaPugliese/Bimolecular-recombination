%% Global fitting of a series of kinetic datasets with an analytical function.

% This script globally fits a series of datasets with the following analytical 
% function: N = N0*exp(-k*t)./(1+gamma/k*N0*(1-exp(-k*t))),
% which is the solution of the following rate equation:
% N' = -k*N - gamma*N^2 (monomolecular decay + bimolecular decay).

% Real datasets can be loaded or created (for testing the code).

% Created-by: Silvina <silvinanorma@gmail.com>

Option_load_datasets = 0;
Option_create_datasets = 1;

%% Load datasets 
if Option_load_datasets;
    % Include code to add datasets from files here.
end;

%% Create datasetssets
if Option_create_datasets;
    k = 3.5;
    gamma = 0.8;
    N0 = [10 20 40 80 100];
    time = linspace(0.01,0.5,50);
    % Concatenate time arrays
    Time = repmat(time,1,size(N0,2));
    params = [k, gamma, N0];
    rng default % for reproducibility
    noise = rand(size(Time))*0.1;
    datasets = Fitting_function(params, Time) + noise;
end;

%% Plot datasets
marker_size = 40;
scatter(Time, datasets, marker_size, 'MarkerFaceColor',[0 .7 .7]);

%% Guess parameters
% [k, gamma, N0]
params = ones(1,size(N0,2)+2);

%% Parameter boundaries
lb = zeros(1,size(N0,2)+2);
ub = ones(1,size(N0,2))*100;

%% Function handle
fun = @(params,Time) Fitting_function(params, Time);

%% Least-squares minimization
output_params = lsqcurvefit(fun,params,Time,datasets,lb,ub);

%% Plot fitting curves
hold on;
for i = 1:size(N0,2);
    Fitting = Fitting_function([output_params(1),output_params(2),output_params(i+2)], time);
    plot(time,Fitting,'linewidth',2);
end;

%% Print output parameters
disp('Output kinetic parameters');
disp('k = ');
disp(output_params(1));
disp('gamma = ');
disp(output_params(2));

