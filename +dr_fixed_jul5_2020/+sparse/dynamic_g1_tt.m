function [T_order, T] = dynamic_g1_tt(y, x, params, steady_state, T_order, T)
if T_order >= 1
    return
end
[T_order, T] = dr_fixed_jul5_2020.sparse.dynamic_resid_tt(y, x, params, steady_state, T_order, T);
T_order = 1;
if size(T, 1) < 11
    T = [T; NaN(11 - size(T, 1), 1)];
end
T(10) = getPowerDeriv(y(14),(-params(2)),1);
T(11) = getPowerDeriv(y(25),(-params(2)),1);
end
