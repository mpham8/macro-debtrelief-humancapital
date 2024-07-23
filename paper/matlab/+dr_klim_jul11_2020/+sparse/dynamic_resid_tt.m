function [T_order, T] = dynamic_resid_tt(y, x, params, steady_state, T_order, T)
if T_order >= 0
    return
end
T_order = 0;
if size(T, 1) < 9
    T = [T; NaN(9 - size(T, 1), 1)];
end
T(1) = y(7)^params(1);
T(2) = y(15)^(-params(2));
T(3) = (1+params(4))^(-1);
T(4) = y(27)^(-params(2));
T(5) = params(3)+1/params(5)*(1-T(2)/y(18));
T(6) = y(19)^(params(1)-1);
T(7) = params(5)/2;
T(8) = 1-params(3)+T(7)*((y(29)/y(19))^2-params(3)^2);
T(9) = T(7)*(y(17)/y(7)-params(3))^2;
end
