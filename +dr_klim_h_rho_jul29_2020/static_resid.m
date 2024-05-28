function residual = static_resid(T, y, x, params, T_flag)
% function residual = static_resid(T, y, x, params, T_flag)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T         [#temp variables by 1]  double   vector of temporary terms to be filled by function
%   y         [M_.endo_nbr by 1]      double   vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1]       double   vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1]     double   vector of parameter values in declaration order
%                                              to evaluate the model
%   T_flag    boolean                 boolean  flag saying whether or not to calculate temporary terms
%
% Output:
%   residual
%

if T_flag
    T = dr_klim_h_rho_jul29_2020.static_resid_tt(T, y, x, params);
end
residual = zeros(16, 1);
    residual(1) = (y(1)) - (x(1)*T(1)*T(2));
    residual(2) = (y(2)) - (y(2)+y(2)*params(7)+y(3)+y(5)+y(8)+y(1)*params(6)-y(1)-x(4));
    residual(3) = (T(3)) - (T(3)*T(4)*(1+y(4)));
    residual(4) = (y(5)) - (y(7)*params(4)+T(5)*(1-T(3)/y(6)));
    residual(5) = (y(6)) - (params(9)*y(11)+T(4)*(y(6)*T(8)+T(2)*T(9)*params(1)*T(3)*(1-x(2))*y(16)));
    residual(6) = (y(7)) - (y(5)+y(7)*(1-params(4))-y(7)*T(10));
    residual(7) = (y(8)) - (y(10)*params(4)+T(5)*(1-T(3)/y(9)));
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
