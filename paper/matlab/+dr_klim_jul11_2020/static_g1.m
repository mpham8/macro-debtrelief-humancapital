function g1 = static_g1(T, y, x, params, T_flag)
% function g1 = static_g1(T, y, x, params, T_flag)
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
%   g1
%

if T_flag
    T = dr_klim_jul11_2020.static_g1_tt(T, y, x, params);
end
g1 = zeros(12, 12);
g1(1,1)=1;
g1(1,7)=(-(x(1)*getPowerDeriv(y(7),params(1),1)));
g1(2,1)=1;
g1(2,2)=1-(1+params(7));
g1(2,3)=(-1);
g1(2,5)=(-1);
g1(3,3)=T(8)-T(2)*(1+y(4))*T(8);
g1(3,4)=(-(T(1)*T(2)));
g1(4,3)=(-(y(7)*1/params(5)*(-(T(8)/y(6)))));
g1(4,5)=1;
g1(4,6)=(-(y(7)*1/params(5)*(-((-T(1))/(y(6)*y(6))))));
g1(4,7)=(-T(3));
g1(5,3)=(-(T(2)*T(6)*y(12)*params(1)*(1-x(2))*T(8)));
g1(5,5)=(-(T(2)*y(6)*T(4)*1/y(7)*2*y(5)/y(7)));
g1(5,6)=1-T(2)*T(5);
g1(5,7)=(-(T(2)*(y(6)*T(4)*2*y(5)/y(7)*(-y(5))/(y(7)*y(7))+params(1)*T(1)*(1-x(2))*y(12)*getPowerDeriv(y(7),params(1)-1,1))));
g1(5,8)=(-params(9));
g1(5,12)=(-(T(2)*T(6)*params(1)*T(1)*(1-x(2))));
g1(6,5)=(-(1-y(7)*T(4)*1/y(7)*2*(y(5)/y(7)-params(3))));
g1(6,7)=1-(1-params(3)-(T(7)+y(7)*T(4)*2*(y(5)/y(7)-params(3))*(-y(5))/(y(7)*y(7))));
g1(7,4)=(-(T(2)*y(6)));
g1(7,6)=(-(T(2)*(y(4)-params(7))));
g1(7,8)=1;
g1(8,7)=(-params(9));
g1(8,11)=1;
g1(9,2)=1;
g1(9,9)=1;
g1(9,11)=(-1);
g1(10,8)=1-(0>y(9)-y(8));
g1(10,9)=1-(1-(0>y(9)-y(8)));
g1(11,4)=(-1);
g1(11,10)=1;
g1(12,12)=1;

end
