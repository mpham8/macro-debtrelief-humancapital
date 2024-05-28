function [lhs, rhs] = static_resid(y, x, params)
T = NaN(13, 1);
lhs = NaN(16, 1);
rhs = NaN(16, 1);
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
lhs(1) = y(1);
rhs(1) = x(1)*T(1)*T(2);
lhs(2) = y(2);
rhs(2) = y(2)+y(2)*params(7)+y(3)+y(5)+y(8)+y(1)*params(6)-y(1)-x(4);
lhs(3) = T(3);
rhs(3) = T(3)*T(4)*(1+y(4));
lhs(4) = y(5);
rhs(4) = y(7)*params(4)+T(5)*(1-T(3)/y(6));
lhs(5) = y(6);
rhs(5) = params(9)*y(11)+T(4)*(y(6)*T(8)+T(2)*T(9)*params(1)*T(3)*(1-x(2))*y(16));
lhs(6) = y(7);
rhs(6) = y(5)+y(7)*(1-params(4))-y(7)*T(10);
lhs(7) = y(8);
rhs(7) = y(10)*params(4)+T(5)*(1-T(3)/y(9));
lhs(8) = y(9);
rhs(8) = T(4)*(y(9)*T(11)+T(12)*T(1)*y(16)*params(2)*T(3)*(1-x(2)));
lhs(9) = y(10);
rhs(9) = y(8)+y(10)*(1-params(4))-y(10)*T(13);
lhs(10) = y(11);
rhs(10) = y(6)*T(4)*(y(4)-params(7));
lhs(11) = y(14);
rhs(11) = y(7)*params(9);
lhs(12) = y(12);
rhs(12) = y(14)-y(2);
lhs(13) = y(12);
rhs(13) = max(0,y(12)-y(11));
lhs(14) = y(13);
rhs(14) = y(4)-params(7);
lhs(15) = y(15);
rhs(15) = y(10)/y(7);
lhs(16) = y(16);
rhs(16) = x(1);
end
