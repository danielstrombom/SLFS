function Q=SLF166np(t)
%Function for simulating the spread in the 166 county region
%starting with only Berks County, PA, infested. 

%INPUT PARAMETER 
%t: Simulation time in years. Starts at 2015, so t=7 simulates up to 2021.

%OUTPUT
%Q: %Matrix containing info about whether a county is infested over simulation
%   time. Counties are indexed by rows, and the columns represents year. 
%   Q(row,column)=1 if 'county ID'=row was infested in Year=column, else 0. 
%   For example, if Q(23,5)=1 then county 23 was infested in simulation year 5. 

%Create adjacency matrices
A=createACS; %Adjacency matrix for neighboring/adjacent counties
I=createISS; %Adjacency matrix for primary interstate connected counties
%save A A
%Calculate number of included counties (here 166)
N=size(A,1);

%Calculate the annual infestation probability p
p=0.25189; %Estimated value of p for the Leung et al. 2004 model (estP.m).

%Calculate densities to be used as settlement probabilities
% Garden Center density
load GCS %load 166 region number of garden centers vector
s=GCS*(1/sum(GCS)); %Calculate garden center density vector

% Population density
load PopS %load 166 region population vector
s1=PopS*(1/sum(PopS)); %Calculate population density vector

% Define infested at t=0 (here 2014) vector
q=zeros(N,1);
q(76,1)=1; %Only Berks County, PA, infested (SID 76)

%Simulate the model for t timesteps
Q=[q]; %Initiate the matrix for collecting infested over time. 
for k=1:t
    q=(1-(1-p).^(A*q))>rand(N,1)-q; %update infested via adjacent spread
    q=(1/2)*(1-(1-s).^(I*q))>rand(N,1)-q; %update infested via interstate spread and GC
    q=(1/2)*(1-(1-s1).^(I*q))>rand(N,1)-q; %update infested via interstate and Pop
    Q=[Q,q];
end    

%save Q Q


