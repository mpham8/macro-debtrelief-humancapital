function [g1, T_order, T] = static_g1(y, x, params, sparse_rowval, sparse_colval, sparse_colptr, T_order, T)
if nargin < 8
    T_order = -1;
    T = NaN(8, 1);
end
[T_order, T] = dr_klim_jul11_2020.sparse.static_g1_tt(y, x, params, T_order, T);
g1_v = NaN(33, 1);
g1_v(1)=1;
g1_v(2)=1;
g1_v(3)=1-(1+params(7));
g1_v(4)=1;
g1_v(5)=(-1);
g1_v(6)=T(8)-T(2)*(1+y(4))*T(8);
g1_v(7)=(-(y(7)*1/params(5)*(-(T(8)/y(6)))));
g1_v(8)=(-(T(2)*T(6)*y(12)*params(1)*(1-x(2))*T(8)));
g1_v(9)=(-(T(1)*T(2)));
g1_v(10)=(-(T(2)*y(6)));
g1_v(11)=(-1);
g1_v(12)=(-1);
g1_v(13)=1;
g1_v(14)=(-(T(2)*y(6)*T(4)*1/y(7)*2*y(5)/y(7)));
g1_v(15)=(-(1-y(7)*T(4)*1/y(7)*2*(y(5)/y(7)-params(3))));
g1_v(16)=(-(y(7)*1/params(5)*(-((-T(1))/(y(6)*y(6))))));
g1_v(17)=1-T(2)*T(5);
g1_v(18)=(-(T(2)*(y(4)-params(7))));
g1_v(19)=(-(x(1)*getPowerDeriv(y(7),params(1),1)));
g1_v(20)=(-T(3));
g1_v(21)=(-(T(2)*(y(6)*T(4)*2*y(5)/y(7)*(-y(5))/(y(7)*y(7))+params(1)*T(1)*(1-x(2))*y(12)*getPowerDeriv(y(7),params(1)-1,1))));
g1_v(22)=1-(1-params(3)-(T(7)+y(7)*T(4)*2*(y(5)/y(7)-params(3))*(-y(5))/(y(7)*y(7))));
g1_v(23)=(-params(9));
g1_v(24)=(-params(9));
g1_v(25)=1;
g1_v(26)=1-(0>y(9)-y(8));
g1_v(27)=1;
g1_v(28)=1-(1-(0>y(9)-y(8)));
g1_v(29)=1;
g1_v(30)=1;
g1_v(31)=(-1);
g1_v(32)=(-(T(2)*T(6)*params(1)*T(1)*(1-x(2))));
g1_v(33)=1;
if ~isoctave && matlab_ver_less_than('9.8')
    sparse_rowval = double(sparse_rowval);
    sparse_colval = double(sparse_colval);
end
g1 = sparse(sparse_rowval, sparse_colval, g1_v, 12, 12);
end
