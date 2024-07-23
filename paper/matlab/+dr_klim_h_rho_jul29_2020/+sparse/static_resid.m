function [residual, T_order, T] = static_resid(y, x, params, T_order, T)
if nargin < 5
    T_order = -1;
    T = NaN(13, 1);
end
[T_order, T] = dr_klim_h_rho_jul29_2020.sparse.static_resid_tt(y, x, params, T_order, T);
residual = NaN(16, 1);
    residual(1) = (y(1)) - (x(1)*T(1)*T(2));
    residual(2) = (y(2)) - (y(2)+y(2)*params(7)+y(3)+y(5)+y(8)+y(1)*params(6)-y(1)-x(4));
    residual(3) = (T(3)) - (T(3)*T(4)*(1+y(4)));
    residual(4) = (y(5)) - (y(7)*(params(4)+T(5)*(1-T(3)/y(6))));
    residual(5) = (y(6)) - (params(9)*y(11)+T(4)*(y(6)*T(8)+T(2)*T(9)*params(1)*T(3)*(1-x(2))*y(16)));
    residual(6) = (y(7)) - (y(5)+y(7)*(1-params(4))-y(7)*T(10));
    residual(7) = (y(8)) - (y(10)*(params(4)+T(5)*(1-T(3)/y(9))));
    residual(8) = (y(9)) - (T(4)*(y(9)*T(11)+T(12)*T(1)*y(16)*params(2)*T(3)*(1-x(2))));
    residual(9) = (y(10)) - (y(8)+y(10)*(1-params(4))-y(10)*T(13));
    residual(10) = (y(11)) - (y(6)*T(4)*(y(4)-params(7)));
    residual(11) = (y(14)) - (y(7)*params(9));
    residual(12) = (y(12)) - (y(14)-y(2));
    residual(13) = (y(12)) - (max(0,y(12)-y(11)));
    residual(14) = (y(13)) - (y(4)-params(7));
    residual(15) = (y(15)) - (y(10)/y(7));
    residual(16) = (y(16)) - (x(1));
end
