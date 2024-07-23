function [residual, T_order, T] = dynamic_resid(y, x, params, steady_state, T_order, T)
if nargin < 6
    T_order = -1;
    T = NaN(17, 1);
end
[T_order, T] = dr_klim_h_rho_jul29_2020.sparse.dynamic_resid_tt(y, x, params, steady_state, T_order, T);
residual = NaN(16, 1);
    residual(1) = (y(17)) - (T(2)*T(3));
    residual(2) = (y(18)) - (y(2)+y(2)*params(7)+y(19)+y(21)+y(24)+y(17)*params(6)-y(17)-x(4));
    residual(3) = (T(4)) - (T(5)*(1+y(20))*T(6));
    residual(4) = (y(21)) - (y(7)*(params(4)+T(7)*(1-T(4)/y(22))));
    residual(5) = (y(22)) - (params(9)*y(27)+T(5)*(y(38)*T(12)+T(9)*T(8)*params(1)*T(6)*(1-x(2))*y(48)));
    residual(6) = (y(23)) - (y(21)+y(7)*(1-params(4))-y(7)*T(13));
    residual(7) = (y(24)) - (y(10)*(params(4)+T(7)*(1-T(4)/y(25))));
    residual(8) = (y(25)) - (T(5)*(y(41)*T(16)+T(15)*T(14)*params(2)*T(6)*(1-x(2))*y(48)));
    residual(9) = (y(26)) - (y(24)+y(10)*(1-params(4))-y(10)*T(17));
    residual(10) = (y(27)) - (y(38)*T(5)*(y(20)-params(7)));
    residual(11) = (y(30)) - (params(9)*y(23));
    residual(12) = (y(28)) - (y(30)-y(18));
    residual(13) = (y(28)) - (max(0,y(28)-y(27)));
    residual(14) = (y(29)) - (y(20)-params(7));
    residual(15) = (y(31)) - (y(26)/y(23));
    residual(16) = (y(32)) - (x(1));
end
