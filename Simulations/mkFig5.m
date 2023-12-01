function X=mkFig5
%Function to create the networks Figure 5.

AS=createACS; %Adjacency matrix for 166 region adjacent counties
IS=createISS; %Adjacency matrix for 166 region primary interstate connected counties
AL=createACL; %Adjacency matrix for 581 region adjacent counties
IL=createISL; %Adjacency matrix for 581 region primary interstate connected counties

%Make diagonals in adjacent counties adjacency matrices 0
for i=1:166
    AS(i,i)=0;
end
for i=1:581
    AL(i,i)=0;
end

subplot(2,2,1)
G = graph(AS);
plot(G);
xticks([])
yticks([])
xlim([-3 3.5])
ylim([-3.5 5])
title('166 county region neighbor network')
set(gcf,'color','w');
subplot(2,2,2)
G = graph(IS);
plot(G)
xticks([])
yticks([])
xlim([-0.1 12.1])
ylim([0 9])
title('166 county region interstate network')
subplot(2,2,3)
G = graph(AL);
plot(G)
xticks([])
yticks([])
xlim([-5 6])
ylim([-4 7])
title('581 county region neighbor network')
subplot(2,2,4)
G = graph(IL);
plot(G)
xticks([])
yticks([])
xlim([0 36])
ylim([0 31])
title('581 county region interstate network')
