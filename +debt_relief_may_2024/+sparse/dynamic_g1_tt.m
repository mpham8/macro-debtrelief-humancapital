function [T_order, T] = dynamic_g1_tt(y, x, params, steady_state, T_order, T)
if T_order >= 1
    return
end
[T_order, T] = debt_relief_may_2024.sparse.dynamic_resid_tt(y, x, params, steady_state, T_order, T);
T_order = 1;
if size(T, 1) < 21
    T = [T; NaN(21 - size(T, 1), 1)];
end
T(19) = getPowerDeriv(y(20),(-params(3)),1);
T(20) = getPowerDeriv(y(37),(-params(3)),1);
T(21) = getPowerDeriv(1+x(3),(-1),1);
end
