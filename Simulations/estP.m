function p=estP
%function to calculate the p parameter in Leung et al. model. This is
%accomplished in 3 steps.
%1. Find the time t to time t+1 infestation distribution as function of 
%using the 2014-2020 data. For all counties that are not infested at time t 
%count number of infested neighbors (Ni) they have and calculate proportion (pI) of
%the counties that got infested in the next timestep t+1.
%2. Use the result from 1 to fit the parameter a in pI=1-exp(-a*Ni)
%and then calculate the parameter p via p=1-exp(-a). See Leung et al. 
%2004 (Eq 1-2)).  

load INF1421 %load the infestation data.
A=createACS; %Create the adjacency matrix for adjacent counties.

I=INF1421; %define I to be the infestation data
T=7; %Number of years (2014-20)
sA=size(A,2); %number of counties

N=zeros(3,2); %To store number of counties that become infested (col 1) and remain non-infested (col 2) as function of number of infested neighbors 1-3 (rows).
NN=[];
for k=1:T-1
    M=zeros(3,2); %to collect number that became infested and num that did not become infested for each number of infested neighbors
    for i=1:sA
        if I(i,k)==0 %If county i not infested at time k
            nIN=sum(A(i,:)*I(:,k)); %number of infested neighbors (data range 0-3)
            NN=[NN,nIN]; %Store number if infested neighbors
            if nIN>0 %If have at least one infested neighbor
                if I(i,k+1)==0 %if county not infested in next timestep either
                    M(nIN,2)=M(nIN,2)+1; %add 1 did not get infested
                else
                    M(nIN,1)=M(nIN,1)+1; %add 1 got infested
                end
            end
        end
    end
    N=N+M; 
end

y=[0;N(:,1)./(N(:,1)+N(:,2))]; %Proportion that got infested as function of number of infested neighbors. 
x=[0,1,2,3]'; %Number of infested neighbors

fitfun = fittype(@(a,x) 1-exp(-a*x)); %Fit parameter a

X=fit(x,y,fitfun);

p=1-exp(-X.a);

         
