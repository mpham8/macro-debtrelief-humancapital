function [g1, T_order, T] = dynamic_g1(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T_order, T)
if nargin < 9
    T_order = -1;
    T = NaN(20, 1);
end
[T_order, T] = dr_klim_h_rho_jul29_2020.sparse.dynamic_g1_tt(y, x, params, steady_state, T_order, T);
g1_v = NaN(66, 1);
g1_v(1)=(-(1+params(7)));
g1_v(2)=(-(T(3)*x(1)*getPowerDeriv(y(7),params(1),1)));
g1_v(3)=(-params(4));
g1_v(4)=(-(1-params(4)-(T(13)+y(7)*T(10)*2*(y(21)/y(7)-params(4))*(-y(21))/(y(7)*y(7)))));
g1_v(5)=(-(T(2)*getPowerDeriv(y(10),params(2),1)));
g1_v(6)=(-params(4));
g1_v(7)=(-(1-params(4)-(T(17)+y(10)*T(10)*2*(y(24)/y(10)-params(4))*(-y(24))/(y(10)*y(10)))));
g1_v(8)=1;
g1_v(9)=(-(params(6)-1));
g1_v(10)=1;
g1_v(11)=1;
g1_v(12)=(-1);
g1_v(13)=T(18);
g1_v(14)=(-(T(7)*(-(T(18)/y(22)))));
g1_v(15)=(-(T(7)*(-(T(18)/y(25)))));
g1_v(16)=(-(T(5)*T(6)));
g1_v(17)=(-(T(5)*y(38)));
g1_v(18)=(-1);
g1_v(19)=(-1);
g1_v(20)=1;
g1_v(21)=(-(1-y(7)*T(10)*1/y(7)*2*(y(21)/y(7)-params(4))));
g1_v(22)=(-(T(7)*(-((-T(4))/(y(22)*y(22))))));
g1_v(23)=1;
g1_v(24)=(-(T(5)*(y(38)*T(10)*2*y(37)/y(23)*(-y(37))/(y(23)*y(23))+T(9)*params(1)*T(6)*(1-x(2))*y(48)*getPowerDeriv(y(23),params(1)-1,1))));
g1_v(25)=1;
g1_v(26)=(-(T(5)*T(15)*params(2)*T(6)*(1-x(2))*y(48)*getPowerDeriv(y(23),params(1),1)));
g1_v(27)=(-params(9));
g1_v(28)=(-((-y(26))/(y(23)*y(23))));
g1_v(29)=(-1);
g1_v(30)=1;
g1_v(31)=(-(1-y(10)*T(10)*1/y(10)*2*(y(24)/y(10)-params(4))));
g1_v(32)=(-(T(7)*(-((-T(4))/(y(25)*y(25))))));
g1_v(33)=1;
g1_v(34)=(-(T(5)*T(8)*params(1)*T(6)*(1-x(2))*y(48)*getPowerDeriv(y(26),params(2),1)));
g1_v(35)=(-(T(5)*(y(41)*T(10)*2*y(40)/y(26)*(-y(40))/(y(26)*y(26))+T(14)*params(2)*T(6)*(1-x(2))*y(48)*getPowerDeriv(y(26),params(2)-1,1))));
g1_v(36)=1;
g1_v(37)=(-(1/y(23)));
g1_v(38)=(-params(9));
g1_v(39)=1;
g1_v(40)=1-(0>y(28)-y(27));
g1_v(41)=1;
g1_v(42)=1-(1-(0>y(28)-y(27)));
g1_v(43)=1;
g1_v(44)=1;
g1_v(45)=(-1);
g1_v(46)=1;
g1_v(47)=1;
g1_v(48)=(-(T(5)*(1+y(20))*T(19)));
g1_v(49)=(-(T(5)*T(9)*T(8)*y(48)*params(1)*(1-x(2))*T(19)));
g1_v(50)=(-(T(5)*T(15)*T(14)*y(48)*params(2)*(1-x(2))*T(19)));
g1_v(51)=(-(T(5)*y(38)*T(10)*1/y(23)*2*y(37)/y(23)));
g1_v(52)=(-(T(5)*T(12)));
g1_v(53)=(-(T(5)*(y(20)-params(7))));
g1_v(54)=(-(T(5)*y(41)*T(10)*1/y(26)*2*y(40)/y(26)));
g1_v(55)=(-(T(5)*T(16)));
g1_v(56)=(-(T(5)*T(9)*params(1)*T(6)*(1-x(2))*T(8)));
g1_v(57)=(-(T(5)*T(15)*params(2)*T(6)*(1-x(2))*T(14)));
g1_v(58)=(-(T(1)*T(3)));
g1_v(59)=(-1);
g1_v(60)=(-(T(5)*T(9)*T(8)*y(48)*params(1)*(-T(6))));
g1_v(61)=(-(T(5)*T(15)*T(14)*y(48)*params(2)*(-T(6))));
g1_v(62)=(-(T(6)*(1+y(20))*T(20)));
g1_v(63)=(-((y(38)*T(12)+T(9)*T(8)*params(1)*T(6)*(1-x(2))*y(48))*T(20)));
g1_v(64)=(-((y(41)*T(16)+T(15)*T(14)*params(2)*T(6)*(1-x(2))*y(48))*T(20)));
g1_v(65)=(-(y(38)*(y(20)-params(7))*T(20)));
g1_v(66)=1;
if ~isoctave && matlab_ver_less_than('9.8')
    sparse_rowval = double(sparse_rowval);
    sparse_colval = double(sparse_colval);
end
g1 = sparse(sparse_rowval, sparse_colval, g1_v, 16, 52);
end
