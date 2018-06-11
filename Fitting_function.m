function yfit = Fitting_function( params, Time )

% This function returns the following analytical solution: 
% N = N0*exp(-k*t)./(1+gamma/k*N0*(1-exp(-k*t))).
% Time and N0 are row vectors.
% N0 = [N0_1 N0_2 ... ]
% Time = [time_1 time_2 ...]
% params = [k, gamma, N0]

% Created-by: Silvina <silvinanorma@gmail.com> 11/06/2018

k = params(1);
gamma = params(2);
N0 = params(3:end);

data_id = ones(size(Time));
num_time_points = size(Time,2)/size(N0,2);
for i = 1:size(Time,2);
    data_id(i) = ceil(i/num_time_points);
end;

yfit = N0(data_id).*exp(-k*Time)./(1+gamma/k*N0(data_id).*(1-exp(-k*Time)));

end

