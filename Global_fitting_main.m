% This script performs a global fitting on a series of datasets
% (recombination kinetics at different pump fluences). Real data can be
% loaded or created using the analytical solution available for the rate
% equation considered. 
% The rate equation contains a monomolecular decay term + a bimolecular decay term (+ noise).
% Rate equation: N' = -k*N - gamma*N^2.
% Analytical solution: N = N0*exp(-k*t)./(1+gamma/k*N0*(1-exp(-k*t))).

% Created-by: Silvina <silvinanorma@gmail.com>

%% Load or create data  
Option_load_data = 0;
Option_create_data = 1;

%% Load data 
% Include code to add data from files here.

%% Create datasets
if Option_create_data;
    time = linspace( 0.01,1,100 );
    k = 2;
    gamma = 0.5;
    N0 = [10 20 40 80];
    dataesets = Create_data(time, N0, k, gamma);
    data1 = dataesets(1,:);
    data2 = dataesets(2,:);
    data3 = dataesets(3,:);
    data4 = dataesets(4,:);
end;

%% Plot data
marker_size = 40;
scatter(time, data1, marker_size);
hold on;
scatter(time, data2, marker_size);
scatter(time, data3, marker_size);
scatter(time, data4, marker_size);

%% Concatenate data
Time = [time, time, time, time];
Data = [data1, data2, data3, data4];

%% Guess parameters
params = ones(1,6);

%% Parameter boundaries

%% Objective function
fun = @(params,Time) Fitting_function(params, Time);

%% Least-squares minimization
output_params = lsqcurvefit(fun,params,Time,Data);

%% Plot fitting curves
Fitting = Fitting_function(output_params, Time);
data_id = [ones(size(Time,2)/4,1); 2*ones(size(Time,2)/4,1); 3*ones(size(Time,2)/4,1); 4*ones(size(Time,2)/4,1)]';
gscatter(Time,Fitting,data_id);


