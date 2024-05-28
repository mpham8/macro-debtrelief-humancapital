function residual = dynamic_resid(T, y, x, params, steady_state, it_, T_flag)
% function residual = dynamic_resid(T, y, x, params, steady_state, it_, T_flag)
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
%   residual
%

if T_flag
    T = dr_klim_h_rho_jul29_2020.dynamic_resid_tt(T, y, x, params, steady_state, it_);
end
residual = zeros(16, 1);
    residual(1) = (y(4)) - (T(2)*T(3));
    residual(2) = (y(5)) - (y(1)+y(1)*params(7)+y(6)+y(8)+y(11)+y(4)*params(6)-y(4)-x(it_, 4));
    residual(3) = (T(4)) - (T(5)*(1+y(7))*T(6));
    residual(4) = (y(8)) - (y(2)*params(4)+T(7)*(1-T(4)/y(9)));
    residual(5) = (y(9)) - (params(9)*y(14)+T(5)*(y(22)*T(12)+T(9)*T(8)*params(1)*T(6)*(1-x(it_, 2))*y(25)));
    residual(6) = (y(10)) - (y(8)+y(2)*(1-params(4))-y(2)*T(13));
    residual(7) = (y(11)) - (y(3)*params(4)+T(7)*(1-T(4)/y(12)));
    residual(8) = (y(12)) - (T(5)*(y(24)*T(16)+T(15)*T(14)*params(2)*T(6)*(1-x(it_, 2))*y(25)));
    residual(9) = (y(13)) - (y(11)+y(3)*(1-params(4))-y(3)*T(17));
    residual(10) = (y(14)) - (y(22)*T(5)*(y(7)-params(7)));
    residual(11) = (y(17)) - (params(9)*y(10));
    residual(12) = (y(15)) - (y(17)-y(5));
    residual(13) = (y(15)) - (max(0,y(15)-y(14)));
    residual(14) = (y(16)) - (y(7)-params(7));
    residual(15) = (y(18)) - (y(13)/y(10));
    residual(16) = (y(19)) - (x(it_, 1));

end
