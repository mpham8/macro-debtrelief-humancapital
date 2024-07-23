function [T_order, T] = static_resid_tt(y, x, params, T_order, T)
if T_order >= 0
    return
end
T_order = 0;
if size(T, 1) < 7
    T = [T; NaN(7 - size(T, 1), 1)];
end
T(1) = y(3)^(-params(2));
T(2) = (1+params(4))^(-1);
T(3) = params(3)+1/params(5)*(1-T(1)/y(6));
T(4) = params(5)/2;
T(5) = 1-params(3)+T(4)*((y(5)/y(7))^2-params(3)^2);
T(6) = y(7)^(params(1)-1);
T(7) = T(4)*(y(5)/y(7)-params(3))^2;
end
