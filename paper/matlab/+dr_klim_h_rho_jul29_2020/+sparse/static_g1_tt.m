function [T_order, T] = static_g1_tt(y, x, params, T_order, T)
if T_order >= 1
    return
end
[T_order, T] = dr_klim_h_rho_jul29_2020.sparse.static_resid_tt(y, x, params, T_order, T);
T_order = 1;
if size(T, 1) < 16
    T = [T; NaN(16 - size(T, 1), 1)];
end
T(14) = getPowerDeriv(y(3),(-params(3)),1);
T(15) = getPowerDeriv(y(7),params(1),1);
T(16) = getPowerDeriv(y(10),params(2),1);
end
