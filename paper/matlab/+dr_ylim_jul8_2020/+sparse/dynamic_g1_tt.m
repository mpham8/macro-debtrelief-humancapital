function [T_order, T] = dynamic_g1_tt(y, x, params, steady_state, T_order, T)
if T_order >= 1
    return
end
[T_order, T] = dr_ylim_jul8_2020.sparse.dynamic_resid_tt(y, x, params, steady_state, T_order, T);
T_order = 1;
if size(T, 1) < 12
    T = [T; NaN(12 - size(T, 1), 1)];
end
T(10) = getPowerDeriv(y(15),(-params(2)),1);
T(11) = getPowerDeriv(y(27),(-params(2)),1);
T(12) = getPowerDeriv(y(19),params(1)-1,1);
end
