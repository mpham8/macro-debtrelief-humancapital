function [residual, T_order, T] = dynamic_resid(y, x, params, steady_state, T_order, T)
if nargin < 6
    T_order = -1;
    T = NaN(9, 1);
end
[T_order, T] = dr_fixed_jul5_2020.sparse.dynamic_resid_tt(y, x, params, steady_state, T_order, T);
residual = NaN(11, 1);
    residual(1) = (y(12)) - (x(1)*T(1));
    residual(2) = (y(13)) - (y(2)+y(2)*params(7)+y(14)+y(16)+params(6)-y(12)-x(3));
    residual(3) = (T(2)) - (T(3)*(1+y(15))*T(4));
    residual(4) = (y(16)) - (y(7)*T(5));
    residual(5) = (y(17)) - (T(3)*(y(28)*T(8)+T(6)*params(1)*T(4)*(1-x(2))*y(33)));
    residual(6) = (y(18)) - (y(16)+y(7)*(1-params(3))-y(7)*T(9));
    residual(7) = (y(19)) - (y(28)*T(3)*(y(15)-params(7)));
    residual(8) = (y(20)) - (params(8)-y(13));
    residual(9) = (y(20)) - (max(0,y(20)-y(19)));
    residual(10) = (y(21)) - (y(15)-params(7));
    residual(11) = (y(22)) - (x(1));
end
