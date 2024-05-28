function [T_order, T] = static_resid_tt(y, x, params, T_order, T)
if T_order >= 0
    return
end
T_order = 0;
if size(T, 1) < 13
    T = [T; NaN(13 - size(T, 1), 1)];
end
T(1) = y(7)^params(1);
T(2) = y(10)^params(2);
T(3) = y(3)^(-params(3));
T(4) = (1+x(3))^(-1);
T(5) = 1/params(5);
T(6) = params(5)/2;
T(7) = params(4)^2;
T(8) = 1-params(4)+T(6)*((y(5)/y(7))^2-T(7));
T(9) = y(7)^(params(1)-1);
T(10) = T(6)*(y(5)/y(7)-params(4))^2;
T(11) = 1-params(4)+T(6)*((y(8)/y(10))^2-T(7));
T(12) = y(10)^(params(2)-1);
T(13) = T(6)*(y(8)/y(10)-params(4))^2;
end
