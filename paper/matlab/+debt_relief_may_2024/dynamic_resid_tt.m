function T = dynamic_resid_tt(T, y, x, params, steady_state, it_)
% function T = dynamic_resid_tt(T, y, x, params, steady_state, it_)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T             [#temp variables by 1]     double  vector of temporary terms to be filled by function
%   y             [#dynamic variables by 1]  double  vector of endogenous variables in the order stored
%                                                    in M_.lead_lag_incidence; see the Manual
%   x             [nperiods by M_.exo_nbr]   double  matrix of exogenous variables (in declaration order)
%                                                    for all simulation periods
%   steady_state  [M_.endo_nbr by 1]         double  vector of steady state values
%   params        [M_.param_nbr by 1]        double  vector of parameter values in declaration order
%   it_           scalar                     double  time period for exogenous variables for which
%                                                    to evaluate the model
%
% Output:
%   T           [#temp variables by 1]       double  vector of temporary terms
%

assert(length(T) >= 18);

T(1) = y(2)^params(1);
T(2) = y(19)*T(1);
T(3) = y(3)^(params(2)-params(10));
T(4) = y(6)^(-params(3));
T(5) = (1+x(it_, 3))^(-1);
T(6) = y(21)^(-params(3));
T(7) = 1/params(5);
T(8) = y(10)^(params(1)-1);
T(9) = y(13)^params(2);
T(10) = params(5)/2;
T(11) = params(4)^2;
T(12) = 1-params(4)+T(10)*((y(22)/y(10))^2-T(11));
T(13) = T(10)*(y(8)/y(2)-params(4))^2;
T(14) = y(10)^params(1);
T(15) = y(13)^(params(2)-1);
T(16) = 1-params(4)+T(10)*((y(24)/y(13))^2-T(11));
T(17) = T(10)*(y(11)/y(3)-params(4))^2;
T(18) = y(3)^params(10);

end
