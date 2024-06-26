function [y, T, residual, g1] = dynamic_2(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T)
residual=NaN(9, 1);
  y(23)=params(9)*y(19);
  T(1)=(1+params(4))^(-1);
  T(2)=y(27)^(-params(2));
  T(3)=y(19)^(params(1)-1);
  T(4)=1-params(3)+params(5)/2*((y(29)/y(19))^2-params(3)^2);
  residual(1)=(y(18))-(params(9)*y(20)+T(1)*(y(30)*T(4)+T(3)*params(1)*T(2)*(1-x(2))*y(36)));
  residual(2)=(y(20))-(y(30)*T(1)*(y(16)-params(7)));
  residual(3)=(y(21))-(max(0,y(21)-y(20)));
  residual(4)=(y(13))-(x(1)*y(7)^params(1));
  T(5)=params(5)/2*(y(17)/y(7)-params(3))^2;
  residual(5)=(y(19))-(y(17)+y(7)*(1-params(3))-y(7)*T(5));
  residual(6)=(y(21))-(y(23)-y(14));
  residual(7)=(y(14))-(y(2)+y(2)*params(7)+y(15)+y(17)+params(6)-y(13)-x(3));
  T(6)=y(15)^(-params(2));
  residual(8)=(T(6))-(T(1)*(1+y(16))*T(2));
  residual(9)=(y(17))-(y(7)*(params(3)+1/params(5)*(1-T(6)/y(18))));
  T(7)=getPowerDeriv(y(15),(-params(2)),1);
  T(8)=getPowerDeriv(y(27),(-params(2)),1);
if nargout > 3
    g1_v = NaN(31, 1);
g1_v(1)=(-(x(1)*getPowerDeriv(y(7),params(1),1)));
g1_v(2)=(-(1-params(3)-(T(5)+y(7)*params(5)/2*2*(y(17)/y(7)-params(3))*(-y(17))/(y(7)*y(7)))));
g1_v(3)=(-(params(3)+1/params(5)*(1-T(6)/y(18))));
g1_v(4)=(-(1+params(7)));
g1_v(5)=(-params(9));
g1_v(6)=1;
g1_v(7)=1-(0>y(21)-y(20));
g1_v(8)=(-(T(1)*y(30)));
g1_v(9)=(-(T(1)*T(2)));
g1_v(10)=1-(1-(0>y(21)-y(20)));
g1_v(11)=1;
g1_v(12)=1;
g1_v(13)=1;
g1_v(14)=(-(T(1)*(y(30)*params(5)/2*2*y(29)/y(19)*(-y(29))/(y(19)*y(19))+params(1)*T(2)*(1-x(2))*y(36)*getPowerDeriv(y(19),params(1)-1,1))));
g1_v(15)=1;
g1_v(16)=(-params(9));
g1_v(17)=1;
g1_v(18)=1;
g1_v(19)=(-(1-y(7)*params(5)/2*1/y(7)*2*(y(17)/y(7)-params(3))));
g1_v(20)=(-1);
g1_v(21)=1;
g1_v(22)=(-1);
g1_v(23)=T(7);
g1_v(24)=(-(y(7)*1/params(5)*(-(T(7)/y(18)))));
g1_v(25)=1;
g1_v(26)=(-(y(7)*1/params(5)*(-((-T(6))/(y(18)*y(18))))));
g1_v(27)=(-(T(1)*y(30)*params(5)/2*1/y(19)*2*y(29)/y(19)));
g1_v(28)=(-(T(1)*T(3)*y(36)*params(1)*(1-x(2))*T(8)));
g1_v(29)=(-(T(1)*(1+y(16))*T(8)));
g1_v(30)=(-(T(1)*T(4)));
g1_v(31)=(-(T(1)*(y(16)-params(7))));
    if ~isoctave && matlab_ver_less_than('9.8')
        sparse_rowval = double(sparse_rowval);
        sparse_colval = double(sparse_colval);
    end
    g1 = sparse(sparse_rowval, sparse_colval, g1_v, 9, 27);
end
end
