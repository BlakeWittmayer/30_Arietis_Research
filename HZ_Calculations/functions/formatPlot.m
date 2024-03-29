function formatPlot(s)
ax = gca; % Get handle to current axes.
ax.FontName = 'times';
title(append(s.Name,' Habitable Zone'),FontSize=30);
if s.Name == '30 Ari Ba'
    a = 0.967;
    plot(a,0,'.',Color='#BF40BF',MarkerSize=55); % 30 Ari Bb
    text(1,-0.2,'30 Ari Bb',HorizontalAlignment='right',FontSize=25, ...
        FontName='times');
    subtitle('[Fictional Single Star Approximation]',FontSize=20, ...
        FontAngle='italic');
end
circle(0,0,s.HZ(1),'#FF0000');
circle(0,0,s.HZ(2),'#EDB120');
circle(0,0,s.HZ(3),'#77AC30');
circle(0,0,s.HZ(4),'#0072BD');
text(s.HZ(1)-0.025,0.15,'Recent Venus',Color='#FF0000',FontSize=20, ...
    HorizontalAlignment='right',FontName='times');
text(s.HZ(2),0.25,'Runaway Greenhouse',Color='#EDB120',FontSize=20, ...
    HorizontalAlignment='left',FontName='times');
text(s.HZ(3),0.15,'Maximum Greenhouse',Color='#77AC30', ...
    FontSize=20,HorizontalAlignment='right',FontName='times');
text(s.HZ(4),0.25,'Early Mars',Color='#0072BD',FontSize=20, ...
    HorizontalAlignment='left',FontName='times');
text(0,0.1,s.Name,FontSize=25,FontName='times', ...
    HorizontalAlignment='center');
ax.XAxisLocation = 'origin';
ax.YLim = [-0.5 0.5];
ax.XLim = [-0.5 5];
ax.YAxis.Visible = 'off';
ax.XAxis.FontSize = 20;
xlabel('Astronomical Units [au]',FontSize=20,FontName='times');
end

function circle(x,y,r,color)
ang=0:0.01:2*pi; 
xp=r*cos(ang);
yp=r*sin(ang);
plot(x+xp,y+yp,LineWidth=1,Color=color);
end