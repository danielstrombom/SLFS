function Q=SLF581np(t)
%Function for simulating the combined spread in the 581 county region
%starting with only Berks County, PA, infested. 

%INPUT PARAMETER 
%t: Simulation time in years. Starts at 2015, so t=11 simulates up to 2025.

%OUTPUT
%Q: %Matrix containing info about whether a county is infested over simulation
%   time. Counties are indexed by rows, and the columns represents year. 
%   Q(row,column)=1 if 'county ID'=row was infested in Year=column, else 0. 
%   For example, if Q(23,5)=1 then county 23 was infested in simulation year 5. 


%CREATE ADJACENCY MATRICES FOR LARGE REGION
A=createACL; %Adjacency matrix for adjacent/neighboring counties
H=createISL; %Adjacency matrix for primary interstate connected counties


%Calculate number of included counties (here 581)
N=size(A,1);

%Use same annual adjacent infestation probability p as for 166 county model 
p=0.25189; %Estimated value for p for the Leung et al. 2004 model (From estP.m)  

%Calculate densities to be used as settlement probabilities

% Garden Center density
load GCL %load 581 region number of garden centers vector
load GCS %load 166 region number of garden centers vector
s=GCL*(1/sum(GCS)); %garden center density to use for large region 

% Population density
load PopL %load 581 region population vector
load PopS %load 166 region population vector
s1=PopL*(1/sum(PopS)); %population density to use for large region

% Define infested at t=0 (here 2014) vector
q=zeros(N,1);
q(343,1)=1; %Only Berks infested (ID 343)

%Simulate the model for t timesteps
Q=[q]; %Initiate the matrix for collecting infested over time. 
for k=1:t
    q=(1-(1-p).^(A*q))>rand(N,1)-q; %update infested via adjacent spread
    q=(1/3.5)*(1-(1-s).^(H*q))>rand(N,1)-q; %update infested via interstate spread and GC
    q=(1/3.5)*(1-(1-s1).^(H*q))>rand(N,1)-q; %update infested via interstate and Pop
    Q=[Q,q];
end    

%save Q Q