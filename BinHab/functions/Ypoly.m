function eqn = Ypoly(Star1,Star2,s_l,a,n)
p = linspace(0,pi,n);
clear Star1.Lp_il Star2.Lp_il

Lp_1l = Lprime_il(Star1.L,s_l,Star1.T_eff);                 % Equation (7)
Lp_2l = Lprime_il(Star2.L,s_l,Star2.T_eff);                 % Equation (7)

eqn = zeros(2,n);
for k = 1:length(p)
    y = sym('y');
    phi = p(k);
    A_2 = 2*a^(2)*(1-2*cos(phi).^2)-s_l^(2)*(Lp_1l+Lp_2l);  % Equation (9a)
    A_1 = 2*a*s_l^(2)*cos(phi)*(Lp_1l+Lp_2l);               % Equation (9b)
    A_0 = a^(4) - a^(2)*s_l^(2)*(Lp_1l+Lp_2l);              % Equation (9c)

    m = y.^(3)-A_2.*y.^(2)-A_0.*y+(4* ...
        A_2.*A_0-A_1.^(2)) == 0;                            % Equation (20)

    c = real(double(vpasolve(m)));
    eqn(1,k) = c(1);
    eqn(2,k) = -c(1);
end
end
