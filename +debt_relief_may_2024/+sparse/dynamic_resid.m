function [residual, T_order, T] = dynamic_resid(y, x, params, steady_state, T_order, T)
if nargin < 6
    T_order = -1;
    T = NaN(18, 1);
end
[T_order, T] = debt_relief_may_2024.sparse.dynamic_resid_tt(y, x, params, steady_state, T_order, T);
residual = NaN(17, 1);
    residual(1) = (y(18)) - (T(2)*T(3));
    residual(2) = (y(19)) - (y(2)+y(2)*params(7)+y(20)+y(22)+y(25)+y(18)*params(6)-y(18)-x(4));
    residual(3) = (T(4)) - (T(5)*(1+y(21))*T(6));
    residual(4) = (y(22)) - (y(7)*(params(4)+T(7)*(1-T(4)/y(23))));
    residual(5) = (y(23)) - (params(9)*y(28)+T(5)*(y(40)*T(12)+T(9)*T(8)*params(1)*T(6)*(1-x(2))*y(51)));
    residual(6) = (y(24)) - (y(22)+y(7)*(1-params(4))-y(7)*T(13));
    residual(7) = (y(25)) - (y(10)*(params(4)+T(7)*(1-T(4)/y(26))));
    residual(8) = (y(26)) - (T(5)*(y(43)*T(16)+T(15)*T(14)*(params(2)-params(10))*T(6)*(1-x(2))*y(51)));
    residual(9) = (y(27)) - (y(25)+y(10)*(1-params(4))-y(10)*T(17));
    residual(10) = (y(28)) - (T(6)*T(5)*(y(21)-params(7)));
    residual(11) = (y(31)) - (params(9)*y(24));
    residual(12) = (y(29)) - (y(31)-y(19));
    residual(13) = (y(29)) - (max(0,y(29)-y(28)));
    residual(14) = (y(30)) - (y(21)-params(7));
    residual(15) = (y(32)) - (y(27)/y(24));
    residual(16) = (y(33)) - (x(1)*T(18));
    residual(17) = (y(34)) - (x(1));
end
