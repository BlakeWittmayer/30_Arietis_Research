% This function calculates the relative habitable zone (RHZ) shape of a
% stellar binary system in units of au. The return value will be a 2xn
% double. The first row corresponds to the bottom half of the shape along
% the domain [0<phi<pi] while the second row corresponds to the upper half
% of the shape along the same domain. Equations, tables, and/or methods
% referenced in this program can be cited and found from the following
% papers:
%
%   M. Cuntz 2014 ApJ 780 14
%
% NOTE: There are bugs that are present or are purposely designed due to
% the goal of the research.
%
% - When phi = 0, an outlier value will be present. A quick fix can be
%   implemented by asssigned the outlier value to NaN.
% - This function will only work for P-type systems (See paper for details)

function z = RHZ(Star1,Star2,s_l,a,n)
phi = linspace(0,pi,n);
clear Star1.Lp_il Star2.Lp_il

Lp_1l = Lprime_il(Star1.L,s_l,Star1.T_eff);             % Equation (7)
Lp_2l = Lprime_il(Star2.L,s_l,Star2.T_eff);             % Equation (7)

A_2 = 2*a^(2)*(1-2*cos(phi).^2)-s_l^(2)*(Lp_1l+Lp_2l);  % Equation (9a)
A_1 = 2*a*s_l^(2)*cos(phi).*(Lp_1l+Lp_2l);              % Equation (9b)
A_0 = a^(4) - a^(2)*s_l^(2)*(Lp_1l+Lp_2l);              % Equation (9c)

ahat_0 = 4*A_0*A_2-A_1.^2;                              % Equation (24a)
ahat_1 = -4*A_0;                                        % Equation (24b)
ahat_2 = -A_2;                                          % Equation (24c)

Q = ahat_1./3-(ahat_2.^2)/9;                            % Equation (23a)
R = -ahat_0./2+(ahat_1.* ...
    ahat_2)./6-(ahat_2.^3)/27;                          % Equation (23b)

D_3 = Q.^3 + R.^2;                                      % Equation (22c)

S = (R+D_3.^(1/2)).^(1/3);                              % Equation (22a)
T = (R-D_3.^(1/2)).^(1/3);                              % Equation (22b)

y_1 = -ahat_2/3 + (S+T);                                % Equation (21)

C = sqrt(-2*a^(2)*(1-2*cos(phi).^(2))+s_l^(2)* ...
    (Lp_1l+Lp_2l)+y_1);                                 % Equation (19a)
D = sqrt(s_l^(2)*(Lp_1l+Lp_2l)+4*a*s_l^(2)* ...
    (Lp_1l-Lp_2l)*C.^(-1).*cos(phi)-2*a^(2)* ...
    (1-2*cos(phi).^(2))-y_1);                           % Equation (19b)
E = sqrt(s_l^(2)*(Lp_1l+Lp_2l)-4*a*s_l^(2)* ...
    (Lp_1l-Lp_2l)*C.^(-1).*cos(phi)-2*a^(2)* ...
    (1-2*cos(phi).^(2))-y_1);                           % Equation (19c)

z(1,:) = real(-C./2 - D./2);                            % Equation (18a)
z(2,:) = real(C./2 + E./2);                             % Equation (18b)
% z(3,:) = real(C./2 -E./2);                            % Equation (18c)
% z(4,:) = real(C./2 +E./2);                            % Equation (18d)
z(2,1) = NaN;
% z(1,n) = NaN;
end