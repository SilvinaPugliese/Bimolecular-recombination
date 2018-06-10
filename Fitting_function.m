function yfit = Fitting_function( params, Time )
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here

k = params(1);
gamma = params(2);
N0 = params(3:6);
data_id = [ones(size(Time,2)/4,1); 2*ones(size(Time,2)/4,1); 3*ones(size(Time,2)/4,1); 4*ones(size(Time,2)/4,1)]';

yfit = N0(data_id).*exp(-k*Time)./(1+gamma/k*N0(data_id).*(1-exp(-k*Time)));

end

