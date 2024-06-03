function g1 = dynamic_g1(T, y, x, params, steady_state, it_, T_flag)
% function g1 = dynamic_g1(T, y, x, params, steady_state, it_, T_flag)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T             [#temp variables by 1]     double   vector of temporary terms to be filled by function
%   y             [#dynamic variables by 1]  double   vector of endogenous variables in the order stored
%                                                     in M_.lead_lag_incidence; see the Manual
%   x             [nperiods by M_.exo_nbr]   double   matrix of exogenous variables (in declaration order)
%                                                     for all simulation periods
%   steady_state  [M_.endo_nbr by 1]         double   vector of steady state values
%   params        [M_.param_nbr by 1]        double   vector of parameter values in declaration order
%   it_           scalar                     double   time period for exogenous variables for which
%                                                     to evaluate the model
%   T_flag        boolean                    boolean  flag saying whether or not to calculate temporary terms
%
% Output:
%   g1
%

if T_flag
    T = dr_klim_h_rho_jul29_2020.dynamic_g1_tt(T, y, x, params, steady_state, it_);
end
g1 = zeros(16, 29);
g1(1,4)=1;
g1(1,2)=(-(T(3)*x(it_, 1)*getPowerDeriv(y(2),params(1),1)));
g1(1,3)=(-(T(2)*getPowerDeriv(y(3),params(2),1)));
g1(1,26)=(-(T(1)*T(3)));
g1(2,4)=(-(params(6)-1));
g1(2,1)=(-(1+params(7)));
g1(2,5)=1;
g1(2,6)=(-1);
g1(2,8)=(-1);
g1(2,11)=(-1);
g1(2,29)=1;
g1(3,6)=T(18);
g1(3,20)=(-(T(5)*(1+y(7))*T(19)));
g1(3,7)=(-(T(5)*T(6)));
g1(3,28)=(-(T(6)*(1+y(7))*T(20)));
g1(4,6)=(-(y(2)*T(7)*(-(T(18)/y(9)))));
g1(4,8)=1;
g1(4,9)=(-(y(2)*T(7)*(-((-T(4))/(y(9)*y(9))))));
g1(4,2)=(-(params(4)+T(7)*(1-T(4)/y(9))));
g1(5,20)=(-(T(5)*T(9)*T(8)*y(25)*params(1)*(1-x(it_, 2))*T(19)));
g1(5,21)=(-(T(5)*y(22)*T(10)*1/y(10)*2*y(21)/y(10)));
g1(5,9)=1;
g1(5,22)=(-(T(5)*T(12)));
g1(5,10)=(-(T(5)*(y(22)*T(10)*2*y(21)/y(10)*(-y(21))/(y(10)*y(10))+T(9)*params(1)*T(6)*(1-x(it_, 2))*y(25)*getPowerDeriv(y(10),params(1)-1,1))));
g1(5,13)=(-(T(5)*T(8)*params(1)*T(6)*(1-x(it_, 2))*y(25)*getPowerDeriv(y(13),params(2),1)));
g1(5,14)=(-params(9));
g1(5,27)=(-(T(5)*T(9)*T(8)*y(25)*params(1)*(-T(6))));
g1(5,28)=(-((y(22)*T(12)+T(9)*T(8)*params(1)*T(6)*(1-x(it_, 2))*y(25))*T(20)));
g1(5,25)=(-(T(5)*T(9)*params(1)*T(6)*(1-x(it_, 2))*T(8)));
g1(6,8)=(-(1-y(2)*T(10)*1/y(2)*2*(y(8)/y(2)-params(4))));
g1(6,2)=(-(1-params(4)-(T(13)+y(2)*T(10)*2*(y(8)/y(2)-params(4))*(-y(8))/(y(2)*y(2)))));
g1(6,10)=1;
g1(7,6)=(-(y(3)*T(7)*(-(T(18)/y(12)))));
g1(7,11)=1;
g1(7,12)=(-(y(3)*T(7)*(-((-T(4))/(y(12)*y(12))))));
g1(7,3)=(-(params(4)+T(7)*(1-T(4)/y(12))));
g1(8,20)=(-(T(5)*T(15)*T(14)*y(25)*params(2)*(1-x(it_, 2))*T(19)));
g1(8,10)=(-(T(5)*T(15)*params(2)*T(6)*(1-x(it_, 2))*y(25)*getPowerDeriv(y(10),params(1),1)));
g1(8,23)=(-(T(5)*y(24)*T(10)*1/y(13)*2*y(23)/y(13)));
g1(8,12)=1;
g1(8,24)=(-(T(5)*T(16)));
g1(8,13)=(-(T(5)*(y(24)*T(10)*2*y(23)/y(13)*(-y(23))/(y(13)*y(13))+T(14)*params(2)*T(6)*(1-x(it_, 2))*y(25)*getPowerDeriv(y(13),params(2)-1,1))));
g1(8,27)=(-(T(5)*T(15)*T(14)*y(25)*params(2)*(-T(6))));
g1(8,28)=(-((y(24)*T(16)+T(15)*T(14)*params(2)*T(6)*(1-x(it_, 2))*y(25))*T(20)));
g1(8,25)=(-(T(5)*T(15)*params(2)*T(6)*(1-x(it_, 2))*T(14)));
g1(9,11)=(-(1-y(3)*T(10)*1/y(3)*2*(y(11)/y(3)-params(4))));
g1(9,3)=(-(1-params(4)-(T(17)+y(3)*T(10)*2*(y(11)/y(3)-params(4))*(-y(11))/(y(3)*y(3)))));
g1(9,13)=1;
g1(10,7)=(-(T(5)*y(22)));
g1(10,22)=(-(T(5)*(y(7)-params(7))));
g1(10,14)=1;
g1(10,28)=(-(y(22)*(y(7)-params(7))*T(20)));
g1(11,10)=(-params(9));
g1(11,17)=1;
g1(12,5)=1;
g1(12,15)=1;
g1(12,17)=(-1);
g1(13,14)=1-(0>y(15)-y(14));
g1(13,15)=1-(1-(0>y(15)-y(14)));
g1(14,7)=(-1);
g1(14,16)=1;
g1(15,10)=(-((-y(13))/(y(10)*y(10))));
g1(15,13)=(-(1/y(10)));
g1(15,18)=1;
g1(16,26)=(-1);
g1(16,19)=1;

end
