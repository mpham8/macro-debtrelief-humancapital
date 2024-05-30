function [residual, T_order, T] = dynamic_resid(y, x, params, steady_state, T_order, T)
if nargin < 6
    T_order = -1;
    T = NaN(9, 1);
end
[T_order, T] = dr_ylim_jul8_2020.sparse.dynamic_resid_tt(y, x, params, steady_state, T_order, T);
residual = NaN(12, 1);
    residual(1) = (y(13)) - (x(1)*T(1));
    residual(2) = (y(14)) - (y(2)+y(2)*params(7)+y(15)+y(17)+params(6)-y(13)-x(3));
    residual(3) = (T(2)) - (T(3)*(1+y(16))*T(4));
    residual(4) = (y(17)) - (y(7)*T(5));
    residual(5) = (y(18)) - (T(3)*(y(30)*T(8)+T(6)*params(1)*T(4)*(1-x(2))*y(36)+T(6)*params(1)*params(8)*y(32)*y(36)));
    residual(6) = (y(19)) - (y(17)+y(7)*(1-params(3))-y(7)*T(9));
    residual(7) = (y(20)) - (y(30)*T(3)*(y(16)-params(7)));
    residual(8) = (y(23)) - (y(13)*params(8));
    residual(9) = (y(21)) - (y(23)-y(14));
    residual(10) = (y(21)) - (max(0,y(21)-y(20)));
    residual(11) = (y(22)) - (y(16)-params(7));
    residual(12) = (y(24)) - (x(1));
end
