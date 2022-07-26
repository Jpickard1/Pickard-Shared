%% Load in a sample network

network = sample_network_generator(20);

%% Make a plot an get reasonable coordinates
% graphplot(network)
G = graph(network);
p = plot(G, 'layout', 'circle');
x = p.XData;
y = p.YData;
cords = [x; y];
close;

%% Plot full network
figure;
subplot(2,2,1);
gplot(network, cords', '-*'); %, 'black')
title('Full Network')
set(gca,'XTick',[]);
set(gca,'YTick',[]);


% Plot random removal
subplot(2,2,2);
[known, unknown] = edge_removal(network, 'R', 0.8);
gplot(known, cords', '-*blue');
hold on;
gplot(unknown, cords', '-red');
title('Random Removal');
set(gca,'XTick',[]);
set(gca,'YTick',[]);

% Plot snow ball removal
subplot(2,2,3);
[known, unknown] = edge_removal(network, 'SB', 0.8);
gplot(known, cords', '-*blue');
hold on;
gplot(unknown, cords', '-red');
title('Snow Ball Removal');
set(gca,'XTick',[]);
set(gca,'YTick',[]);

% Plot random removal
subplot(2,2,4);
[known, unknown] = edge_removal(network, 'R', 0.8);
gplot(known, cords', '-*blue');
hold on;
gplot(unknown, cords', '-red');
title('Right Censoring Removal');
set(gca,'XTick',[]);
set(gca,'YTick',[]);

% saveas(gcf, 'edge removal methods.png');

