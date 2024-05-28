function T = static_resid_tt(T, y, x, params)
% function T = static_resid_tt(T, y, x, params)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T         [#temp variables by 1]  double   vector of temporary terms to be filled by function
%   y         [M_.endo_nbr by 1]      double   vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1]       double   vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1]     double   vector of parameter values in declaration order
%
% Output:
%   T         [#temp variables by 1]  double   vector of temporary terms
%

assert(length(T) >= 13);

T(1) = y(7)^params(1);
T(2) = y(10)^params(2);
T(3) = y(3)^(-params(3));
T(4) = (1+x(3))^(-1);
T(5) = 1/params(5);
T(6) = params(5)/2;
T(7) = params(4)^2;
T(8) = 1-params(4)+T(6)*((y(5)/y(7))^2-T(7));
T(9) = y(7)^(params(1)-1);
T(10) = T(6)*(y(5)/y(7)-params(4))^2;
T(11) = 1-params(4)+T(6)*((y(8)/y(10))^2-T(7));
T(12) = y(10)^(params(2)-1);
T(13) = T(6)*(y(8)/y(10)-params(4))^2;

end
