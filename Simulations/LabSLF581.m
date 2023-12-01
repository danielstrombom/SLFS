function pQ581=LabSLF581
%Function to run the combined spread model in the 581 county region T times starting with only Berks 
%County, %PA, infested in 2014 for t years starting from 2015. 
%The output X is a matrix with 581 rows, one for each county included, and 
%t+1 columns, that gives the proportion of simulations that each county got infested in each year 2014-21

T=1000;  %Number of simulation runs 
t=11;     %Number of years starting from 2015 (t=11 gives 2025)
         
QCD=zeros(581,t+1); %To collect number of times each county got infested in each year

%Main simulation loop. Run T simulations, each for t years.
for k=1:T
    Q=SLF581np(t); %Simulate the model once for t years starting from Berks infested
    QCD=QCD+Q;
end

pQ581=((1/T)*QCD); %Proportion of simulations each county got infested in each year 2014-25

save pQ581 pQ581

