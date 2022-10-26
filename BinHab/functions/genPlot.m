% This function plots the habitable zone boundaries (HZB), oribtal
% stability limit, and radiative habitable zone (RHZ) for a stellar binary
% system. Equations, tables, and/or methods
% referenced in this program can be cited and found from the following
% papers:
%
%   M. Cuntz 2014 ApJ 780 14

function genPlot(a_cr,z_in,z_out,n,a)
% Calculate RHL's
t = linspace(0,2*pi,n);

RHZ_in = max(abs(z_in(1,1:n)));                         % Equation (39a)
RHZ_out = min(abs(z_out(1,1:n)));                       % Equation (39b)
R = RHZ_out*ones(size(t));
r = RHZ_in*ones(size(t));
lim = a_cr*ones(size(t));

fprintf("RHZ inner limit = %.4f au\n",RHZ_in);
fprintf("RHZ outer limit = %.4f au\n",RHZ_out);
fprintf("Inner stability limit = %.4f au\n",a_cr);

% Generate plot
phi = linspace(0,pi,n);
polarplot(t,lim,'--k',LineWidth=1.5);
hold on
polarplot(phi,z_in,'-r');
polarplot(phi,z_out,'-b');
polarplot(pi,a,'.',Color='#EDB120',MarkerSize=30);
polarplot(0,a,'.',Color='#EDB120',MarkerSize=15);
text(pi,a,'Ba',HorizontalAlignment='center', ...
    VerticalAlignment='top');
text(0,a,'Bb',HorizontalAlignment='center', ...
    VerticalAlignment='top')

polarplot(t,R,Color='#808080');
polarplot(t,r,Color='#808080');

polarplot(pi,RHZ_in,'diamond',Color='r',MarkerFaceColor='r');
polarplot(0,RHZ_out,'diamond',Color='b',MarkerFaceColor='b');

hold off
end