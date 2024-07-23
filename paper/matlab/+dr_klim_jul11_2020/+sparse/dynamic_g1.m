function [g1, T_order, T] = dynamic_g1(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T_order, T)
if nargin < 9
    T_order = -1;
    T = NaN(11, 1);
end
[T_order, T] = dr_klim_jul11_2020.sparse.dynamic_g1_tt(y, x, params, steady_state, T_order, T);
g1_v = NaN(41, 1);
g1_v(1)=(-(1+params(7)));
g1_v(2)=(-(x(1)*getPowerDeriv(y(7),params(1),1)));
g1_v(3)=(-T(5));
g1_v(4)=(-(1-params(3)-(T(9)+y(7)*T(7)*2*(y(17)/y(7)-params(3))*(-y(17))/(y(7)*y(7)))));
g1_v(5)=1;
g1_v(6)=1;
g1_v(7)=1;
g1_v(8)=1;
g1_v(9)=(-1);
g1_v(10)=T(10);
g1_v(11)=(-(y(7)*1/params(5)*(-(T(10)/y(18)))));
g1_v(12)=(-(T(3)*T(4)));
g1_v(13)=(-(T(3)*y(30)));
g1_v(14)=(-1);
g1_v(15)=(-1);
g1_v(16)=1;
g1_v(17)=(-(1-y(7)*T(7)*1/y(7)*2*(y(17)/y(7)-params(3))));
g1_v(18)=(-(y(7)*1/params(5)*(-((-T(2))/(y(18)*y(18))))));
g1_v(19)=1;
g1_v(20)=(-(T(3)*(y(30)*T(7)*2*y(29)/y(19)*(-y(29))/(y(19)*y(19))+params(1)*T(4)*(1-x(2))*y(36)*getPowerDeriv(y(19),params(1)-1,1))));
g1_v(21)=1;
g1_v(22)=(-params(9));
g1_v(23)=(-params(9));
g1_v(24)=1;
g1_v(25)=1-(0>y(21)-y(20));
g1_v(26)=1;
g1_v(27)=1-(1-(0>y(21)-y(20)));
g1_v(28)=1;
g1_v(29)=1;
g1_v(30)=(-1);
g1_v(31)=1;
g1_v(32)=(-(T(3)*(1+y(16))*T(11)));
g1_v(33)=(-(T(3)*T(6)*y(36)*params(1)*(1-x(2))*T(11)));
g1_v(34)=(-(T(3)*y(30)*T(7)*1/y(19)*2*y(29)/y(19)));
g1_v(35)=(-(T(3)*T(8)));
g1_v(36)=(-(T(3)*(y(16)-params(7))));
g1_v(37)=(-(T(3)*params(1)*T(4)*(1-x(2))*T(6)));
g1_v(38)=(-T(1));
g1_v(39)=(-1);
g1_v(40)=(-(T(3)*T(6)*y(36)*params(1)*(-T(4))));
g1_v(41)=1;
if ~isoctave && matlab_ver_less_than('9.8')
    sparse_rowval = double(sparse_rowval);
    sparse_colval = double(sparse_colval);
end
g1 = sparse(sparse_rowval, sparse_colval, g1_v, 12, 39);
end
