function pQ166=LabSLF166
%Function to run the combined spread model T times starting with only Berks 
%County, %PA, infested in 2014 for t years starting from 2015. 
%The output pQ166 is a matrix with 166 rows, one for each county included, and 
%t+1 columns, one for each year starting at 2014 and ending at 2014+t. 

T=1000;  %Number of simulation runs 
t=7;     %Number of years starting from 2015 (t=7 gives 2021)

QCD=zeros(166,8); %To collect number of times each county got infested in each year

%Main simulation loop. Run T simulations, each for t years.
for k=1:T 
    Q=SLF166np(t); %Simulate the model once for t years starting from Berks infested
    QCD=QCD+Q;
end

pQ166=((1/T)*QCD); %Proportion of simulations each county got infested in each year 2014-21

save pQ166;


