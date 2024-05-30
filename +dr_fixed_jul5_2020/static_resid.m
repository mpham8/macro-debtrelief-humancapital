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
    T = dr_fixed_jul5_2020.static_resid_tt(T, y, x, params);
end
residual = zeros(11, 1);
    residual(1) = (y(1)) - (x(1)*y(7)^params(1));
    residual(2) = (y(2)) - (y(2)+y(2)*params(7)+y(3)+y(5)+params(6)-y(1)-x(3));
    residual(3) = (T(1)) - (T(1)*T(2)*(1+y(4)));
    residual(4) = (y(5)) - (y(7)*T(3));
    residual(5) = (y(6)) - (T(2)*(y(6)*T(5)+T(6)*params(1)*T(1)*(1-x(2))*y(11)));
    residual(6) = (y(7)) - (y(5)+y(7)*(1-params(3))-y(7)*T(7));
    residual(7) = (y(8)) - (y(6)*T(2)*(y(4)-params(7)));
    residual(8) = (y(9)) - (params(8)-y(2));
    residual(9) = (y(9)) - (max(0,y(9)-y(8)));
    residual(10) = (y(10)) - (y(4)-params(7));
    residual(11) = (y(11)) - (x(1));

end
