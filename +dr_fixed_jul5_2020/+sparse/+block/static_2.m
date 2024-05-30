function [y, T, residual, g1] = static_2(y, x, params, sparse_rowval, sparse_colval, sparse_colptr, T)
residual=NaN(9, 1);
  residual(1)=(y(2))-(y(2)+y(2)*params(7)+y(3)+y(5)+params(6)-y(1)-x(3));
  T(1)=y(3)^(-params(2));
  T(2)=(1+params(4))^(-1);
  residual(2)=(T(1))-(T(1)*T(2)*(1+y(4)));
  residual(3)=(y(5))-(y(7)*(params(3)+1/params(5)*(1-T(1)/y(6))));
  T(3)=1-params(3)+params(5)/2*((y(5)/y(7))^2-params(3)^2);
  T(4)=y(7)^(params(1)-1);
  residual(4)=(y(6))-(T(2)*(y(6)*T(3)+T(4)*params(1)*T(1)*(1-x(2))*y(11)));
  T(5)=params(5)/2*(y(5)/y(7)-params(3))^2;
  residual(5)=(y(7))-(y(5)+y(7)*(1-params(3))-y(7)*T(5));
  residual(6)=(y(8))-(y(6)*T(2)*(y(4)-params(7)));
  residual(7)=(y(9))-(params(8)-y(2));
  residual(8)=(y(9))-(max(0,y(9)-y(8)));
  residual(9)=(y(1))-(x(1)*y(7)^params(1));
  T(6)=getPowerDeriv(y(3),(-params(2)),1);
if nargout > 3
    g1_v = NaN(25, 1);
g1_v(1)=(-1);
g1_v(2)=T(6)-T(2)*(1+y(4))*T(6);
g1_v(3)=(-(y(7)*1/params(5)*(-(T(6)/y(6)))));
g1_v(4)=(-(T(2)*T(4)*y(11)*(1-x(2))*params(1)*T(6)));
g1_v(5)=(-(T(1)*T(2)));
g1_v(6)=(-(T(2)*y(6)));
g1_v(7)=(-(y(7)*1/params(5)*(-((-T(1))/(y(6)*y(6))))));
g1_v(8)=1-T(2)*T(3);
g1_v(9)=(-(T(2)*(y(4)-params(7))));
g1_v(10)=(-(params(3)+1/params(5)*(1-T(1)/y(6))));
g1_v(11)=(-(T(2)*(y(6)*params(5)/2*2*y(5)/y(7)*(-y(5))/(y(7)*y(7))+params(1)*T(1)*(1-x(2))*y(11)*getPowerDeriv(y(7),params(1)-1,1))));
g1_v(12)=1-(1-params(3)-(T(5)+y(7)*params(5)/2*2*(y(5)/y(7)-params(3))*(-y(5))/(y(7)*y(7))));
g1_v(13)=(-(x(1)*getPowerDeriv(y(7),params(1),1)));
g1_v(14)=(-1);
g1_v(15)=1;
g1_v(16)=(-(T(2)*y(6)*params(5)/2*1/y(7)*2*y(5)/y(7)));
g1_v(17)=(-(1-y(7)*params(5)/2*1/y(7)*2*(y(5)/y(7)-params(3))));
g1_v(18)=1;
g1_v(19)=1-(0>y(9)-y(8));
g1_v(20)=1-(1+params(7));
g1_v(21)=1;
g1_v(22)=1;
g1_v(23)=1-(1-(0>y(9)-y(8)));
g1_v(24)=1;
g1_v(25)=1;
    if ~isoctave && matlab_ver_less_than('9.8')
        sparse_rowval = double(sparse_rowval);
        sparse_colval = double(sparse_colval);
    end
    g1 = sparse(sparse_rowval, sparse_colval, g1_v, 9, 9);
end
end
