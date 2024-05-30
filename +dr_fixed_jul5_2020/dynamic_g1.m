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
    T = dr_fixed_jul5_2020.dynamic_g1_tt(T, y, x, params, steady_state, it_);
end
g1 = zeros(11, 20);
g1(1,3)=1;
g1(1,2)=(-(x(it_, 1)*getPowerDeriv(y(2),params(1),1)));
g1(1,18)=(-T(1));
g1(2,3)=1;
g1(2,1)=(-(1+params(7)));
g1(2,4)=1;
g1(2,5)=(-1);
g1(2,7)=(-1);
g1(2,20)=1;
g1(3,5)=T(10);
g1(3,14)=(-(T(3)*(1+y(6))*T(11)));
g1(3,6)=(-(T(3)*T(4)));
g1(4,5)=(-(y(2)*1/params(5)*(-(T(10)/y(8)))));
g1(4,7)=1;
g1(4,8)=(-(y(2)*1/params(5)*(-((-T(2))/(y(8)*y(8))))));
g1(4,2)=(-T(5));
g1(5,14)=(-(T(3)*T(6)*y(17)*(1-x(it_, 2))*params(1)*T(11)));
g1(5,15)=(-(T(3)*y(16)*T(7)*1/y(9)*2*y(15)/y(9)));
g1(5,8)=1;
g1(5,16)=(-(T(3)*T(8)));
g1(5,9)=(-(T(3)*(y(16)*T(7)*2*y(15)/y(9)*(-y(15))/(y(9)*y(9))+params(1)*T(4)*(1-x(it_, 2))*y(17)*getPowerDeriv(y(9),params(1)-1,1))));
g1(5,19)=(-(T(3)*T(6)*y(17)*(-(params(1)*T(4)))));
g1(5,17)=(-(T(3)*params(1)*T(4)*(1-x(it_, 2))*T(6)));
g1(6,7)=(-(1-y(2)*T(7)*1/y(2)*2*(y(7)/y(2)-params(3))));
g1(6,2)=(-(1-params(3)-(T(9)+y(2)*T(7)*2*(y(7)/y(2)-params(3))*(-y(7))/(y(2)*y(2)))));
g1(6,9)=1;
g1(7,6)=(-(T(3)*y(16)));
g1(7,16)=(-(T(3)*(y(6)-params(7))));
g1(7,10)=1;
g1(8,4)=1;
g1(8,11)=1;
g1(9,10)=1-(0>y(11)-y(10));
g1(9,11)=1-(1-(0>y(11)-y(10)));
g1(10,6)=(-1);
g1(10,12)=1;
g1(11,18)=(-1);
g1(11,13)=1;

end
