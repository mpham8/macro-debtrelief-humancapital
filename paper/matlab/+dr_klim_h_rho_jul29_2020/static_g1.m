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
    T = dr_klim_h_rho_jul29_2020.static_g1_tt(T, y, x, params);
end
g1 = zeros(16, 16);
g1(1,1)=1;
g1(1,7)=(-(T(2)*x(1)*T(15)));
g1(1,10)=(-(x(1)*T(1)*T(16)));
g1(2,1)=(-(params(6)-1));
g1(2,2)=1-(1+params(7));
g1(2,3)=(-1);
g1(2,5)=(-1);
g1(2,8)=(-1);
g1(3,3)=T(14)-T(4)*(1+y(4))*T(14);
g1(3,4)=(-(T(3)*T(4)));
g1(4,3)=(-(y(7)*T(5)*(-(T(14)/y(6)))));
g1(4,5)=1;
g1(4,6)=(-(y(7)*T(5)*(-((-T(3))/(y(6)*y(6))))));
g1(4,7)=(-(params(4)+T(5)*(1-T(3)/y(6))));
g1(5,3)=(-(T(4)*T(2)*T(9)*y(16)*params(1)*(1-x(2))*T(14)));
g1(5,5)=(-(T(4)*y(6)*T(6)*1/y(7)*2*y(5)/y(7)));
g1(5,6)=1-T(4)*T(8);
g1(5,7)=(-(T(4)*(y(6)*T(6)*2*y(5)/y(7)*(-y(5))/(y(7)*y(7))+T(2)*params(1)*T(3)*(1-x(2))*y(16)*getPowerDeriv(y(7),params(1)-1,1))));
g1(5,10)=(-(T(4)*T(9)*params(1)*T(3)*(1-x(2))*y(16)*T(16)));
g1(5,11)=(-params(9));
g1(5,16)=(-(T(4)*T(2)*T(9)*params(1)*T(3)*(1-x(2))));
g1(6,5)=(-(1-y(7)*T(6)*1/y(7)*2*(y(5)/y(7)-params(4))));
g1(6,7)=1-(1-params(4)-(T(10)+y(7)*T(6)*2*(y(5)/y(7)-params(4))*(-y(5))/(y(7)*y(7))));
g1(7,3)=(-(y(10)*T(5)*(-(T(14)/y(9)))));
g1(7,8)=1;
g1(7,9)=(-(y(10)*T(5)*(-((-T(3))/(y(9)*y(9))))));
g1(7,10)=(-(params(4)+T(5)*(1-T(3)/y(9))));
g1(8,3)=(-(T(4)*T(12)*T(1)*y(16)*params(2)*(1-x(2))*T(14)));
g1(8,7)=(-(T(4)*T(12)*y(16)*params(2)*T(3)*(1-x(2))*T(15)));
g1(8,8)=(-(T(4)*y(9)*T(6)*1/y(10)*2*y(8)/y(10)));
g1(8,9)=1-T(4)*T(11);
g1(8,10)=(-(T(4)*(y(9)*T(6)*2*y(8)/y(10)*(-y(8))/(y(10)*y(10))+T(1)*y(16)*params(2)*T(3)*(1-x(2))*getPowerDeriv(y(10),params(2)-1,1))));
g1(8,16)=(-(T(4)*T(12)*T(1)*params(2)*T(3)*(1-x(2))));
g1(9,8)=(-(1-y(10)*T(6)*1/y(10)*2*(y(8)/y(10)-params(4))));
g1(9,10)=1-(1-params(4)-(T(13)+y(10)*T(6)*2*(y(8)/y(10)-params(4))*(-y(8))/(y(10)*y(10))));
g1(10,4)=(-(T(4)*y(6)));
g1(10,6)=(-(T(4)*(y(4)-params(7))));
g1(10,11)=1;
g1(11,7)=(-params(9));
g1(11,14)=1;
g1(12,2)=1;
g1(12,12)=1;
g1(12,14)=(-1);
g1(13,11)=1-(0>y(12)-y(11));
g1(13,12)=1-(1-(0>y(12)-y(11)));
g1(14,4)=(-1);
g1(14,13)=1;
g1(15,7)=(-((-y(10))/(y(7)*y(7))));
g1(15,10)=(-(1/y(7)));
g1(15,15)=1;
g1(16,16)=1;

end
