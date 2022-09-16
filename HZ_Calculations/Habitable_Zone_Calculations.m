% Housekeeping
clear; 
clc;
close all

% Input Data
Star.A.Name = '30 Arietis Aa';
Star.A.HZ = HZ_Dist(8647.00,4.165); % HZ distances for 30 Ari Aa [AU]
Star.B.Name = '30 Arietis Ba';
Star.B.HZ = HZ_Dist(6211.27,2.396); % HZ distances for 30 Ari Ba [AU]

% Graphical settings
figure('Name','30 Arietis Habitable Zones','NumberTitle','off','units','normalized','outerposition',[0 0 1 1]);
tiledlayout(2,1);

% Top plot
nexttile
plot(0,0,'.','Color','#EDB120','MarkerSize',30); % Star at origin
hold on
formatPlot(Star.A);
hold off

% Bottom plot
nexttile
plot(0,0,'.','Color','#EDB120','MarkerSize',30); % Star at origin 
hold on
formatPlot(Star.B);
hold off
