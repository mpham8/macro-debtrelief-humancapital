function [T_order, T] = dynamic_resid_tt(y, x, params, steady_state, T_order, T)
if T_order >= 0
    return
end
T_order = 0;
if size(T, 1) < 17
    T = [T; NaN(17 - size(T, 1), 1)];
end
T(1) = y(7)^params(1);
T(2) = x(1)*T(1);
T(3) = y(10)^params(2);
T(4) = y(19)^(-params(3));
T(5) = (1+x(3))^(-1);
T(6) = y(35)^(-params(3));
T(7) = 1/params(5);
T(8) = y(23)^(params(1)-1);
T(9) = y(26)^params(2);
T(10) = params(5)/2;
T(11) = params(4)^2;
T(12) = 1-params(4)+T(10)*((y(37)/y(23))^2-T(11));
T(13) = T(10)*(y(21)/y(7)-params(4))^2;
T(14) = y(23)^params(1);
T(15) = y(26)^(params(2)-1);
T(16) = 1-params(4)+T(10)*((y(40)/y(26))^2-T(11));
T(17) = T(10)*(y(24)/y(10)-params(4))^2;
end
