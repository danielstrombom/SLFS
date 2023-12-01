function A=createACS
%Function to create Adjacency matrix for all counties in the 166 county region 
%from the Adjacency data file (Data) and FIPS to ID Conversion data (ConvS)

%LOAD DATA
load ConvS %Matrix for Conversion FIPS to SID
load Data %County adjacency list from the US Census Bureau
Conv=ConvS; %rename for convenience

%INITIATE CData
CData=Data; %Idea is to overwrite all FIPS in the region by their ID (will leave all FIPS not in region unchanged)

%CONVERT Data FIPS to ID
%First Data column
for i=1:size(Data,1)
	for j=1:size(Conv,1)
		if Data(i,1)==Conv(j,1) %If Data FIPS match Conv FIPS
			CData(i,1)=Conv(j,2); % Set CData ID equal to Conv ID
		end
	end
end
%Second Data column
for i=1:size(Data,1)
	for j=1:size(Conv,1)
		if Data(i,2)==Conv(j,1) %If Data FIPS match Conv FIPS
			CData(i,2)=Conv(j,2); % Set CData ID equal to Conv ID
		end
	end
end

%INITIATE ADJ MATRIX
IDmax=max(Conv(:,2)); %Largest ID=number of counties in region
A=zeros(IDmax,IDmax);

%FILL ADJ MATRIX
for k=1:size(CData,1)
    if CData(k,1)<=IDmax && CData(k,2)<=IDmax %If adjacent in the region (else FIPS still there which is larger than IDmax & thus ignored
        A(CData(k,1),CData(k,2))=1; %Should create symmetric matrix, check that is the case, else investigate
    end
end

%UNCOMMENT TO DISPLAY THE NETWORK        
% G=graph(A);
% G.Edges
% plot(G)