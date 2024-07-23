function [residual, T_order, T] = static_resid(y, x, params, T_order, T)
if nargin < 5
    T_order = -1;
    T = NaN(7, 1);
end
[T_order, T] = dr_klim_jul11_2020.sparse.static_resid_tt(y, x, params, T_order, T);
residual = NaN(12, 1);
    residual(1) = (y(1)) - (x(1)*y(7)^params(1));
    residual(2) = (y(2)) - (y(2)+y(2)*params(7)+y(3)+y(5)+params(6)-y(1)-x(3));
    residual(3) = (T(1)) - (T(1)*T(2)*(1+y(4)));
    residual(4) = (y(5)) - (y(7)*T(3));
    residual(5) = (y(6)) - (params(9)*y(8)+T(2)*(y(6)*T(5)+T(6)*params(1)*T(1)*(1-x(2))*y(12)));
    residual(6) = (y(7)) - (y(5)+y(7)*(1-params(3))-y(7)*T(7));
    residual(7) = (y(8)) - (y(6)*T(2)*(y(4)-params(7)));
    residual(8) = (y(11)) - (y(7)*params(9));
    residual(9) = (y(9)) - (y(11)-y(2));
    residual(10) = (y(9)) - (max(0,y(9)-y(8)));
    residual(11) = (y(10)) - (y(4)-params(7));
    residual(12) = (y(12)) - (x(1));
end
