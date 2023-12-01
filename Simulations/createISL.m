function A=createISL
%Function to create the primary interstate highway adjacency matrix from table with
%interstate numbers in the 581 county region (ICL.mat)

load ICL
IC=ICL;

%CREATE ADJACENCY MATRIX
N=size(IC,1);
A=zeros(N,N); %Create empty NxN matrix 
for i=1:N %Each county
    for j=1:size(IC,2) %Each potential interstate record
        if IC(i,j)~=0 %that is not 0 (i.e. no record)
            for k=1:N %Go through each county
                if k~=i %not yourself
                    for l=1:size(IC,2) %Each potential interstate record
                        if IC(k,l)~=0 %that is not 0 (i.e. no record)
                            if IC(i,j)==IC(k,l) %If same interstate number recorded
                                A(i,k)=1; % Record that counties connected (by at least 1 IC)
                            end
                        end
                    end
                end
            end
        end
    end
end
        
%UNCOMMENT TO PLOT NETWORK        
% G=graph(A);
% G.Edges
% plot(G)