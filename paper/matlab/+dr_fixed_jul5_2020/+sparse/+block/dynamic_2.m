function [y, T, residual, g1] = dynamic_2(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T)
residual=NaN(9, 1);
  T(1)=y(14)^(-params(2));
  T(2)=(1+params(4))^(-1);
  T(3)=y(25)^(-params(2));
  residual(1)=(T(1))-(T(2)*(1+y(15))*T(3));
  residual(2)=(y(19))-(y(28)*T(2)*(y(15)-params(7)));
  residual(3)=(y(20))-(max(0,y(20)-y(19)));
  residual(4)=(y(12))-(x(1)*y(7)^params(1));
  T(4)=params(5)/2*(y(16)/y(7)-params(3))^2;
  residual(5)=(y(18))-(y(16)+y(7)*(1-params(3))-y(7)*T(4));
  residual(6)=(y(20))-(params(8)-y(13));
  residual(7)=(y(13))-(y(2)+y(2)*params(7)+y(14)+y(16)+params(6)-y(12)-x(3));
  residual(8)=(y(16))-(y(7)*(params(3)+1/params(5)*(1-T(1)/y(17))));
  T(5)=y(18)^(params(1)-1);
  T(6)=1-params(3)+params(5)/2*((y(27)/y(18))^2-params(3)^2);
  residual(9)=(y(17))-(T(2)*(y(28)*T(6)+T(5)*params(1)*T(3)*(1-x(2))*y(33)));
  T(7)=getPowerDeriv(y(14),(-params(2)),1);
  T(8)=getPowerDeriv(y(25),(-params(2)),1);
if nargout > 3
    g1_v = NaN(29, 1);
g1_v(1)=(-(x(1)*getPowerDeriv(y(7),params(1),1)));
g1_v(2)=(-(1-params(3)-(T(4)+y(7)*params(5)/2*2*(y(16)/y(7)-params(3))*(-y(16))/(y(7)*y(7)))));
g1_v(3)=(-(params(3)+1/params(5)*(1-T(1)/y(17))));
g1_v(4)=(-(1+params(7)));
g1_v(5)=(-(T(2)*T(3)));
g1_v(6)=(-(T(2)*y(28)));
g1_v(7)=1;
g1_v(8)=1-(0>y(20)-y(19));
g1_v(9)=1-(1-(0>y(20)-y(19)));
g1_v(10)=1;
g1_v(11)=1;
g1_v(12)=1;
g1_v(13)=1;
g1_v(14)=(-(T(2)*(y(28)*params(5)/2*2*y(27)/y(18)*(-y(27))/(y(18)*y(18))+params(1)*T(3)*(1-x(2))*y(33)*getPowerDeriv(y(18),params(1)-1,1))));
g1_v(15)=1;
g1_v(16)=1;
g1_v(17)=(-(1-y(7)*params(5)/2*1/y(7)*2*(y(16)/y(7)-params(3))));
g1_v(18)=(-1);
g1_v(19)=1;
g1_v(20)=T(7);
g1_v(21)=(-1);
g1_v(22)=(-(y(7)*1/params(5)*(-(T(7)/y(17)))));
g1_v(23)=(-(y(7)*1/params(5)*(-((-T(1))/(y(17)*y(17))))));
g1_v(24)=1;
g1_v(25)=(-(T(2)*y(28)*params(5)/2*1/y(18)*2*y(27)/y(18)));
g1_v(26)=(-(T(2)*(1+y(15))*T(8)));
g1_v(27)=(-(T(2)*T(5)*y(33)*(1-x(2))*params(1)*T(8)));
g1_v(28)=(-(T(2)*(y(15)-params(7))));
g1_v(29)=(-(T(2)*T(6)));
    if ~isoctave && matlab_ver_less_than('9.8')
        sparse_rowval = double(sparse_rowval);
        sparse_colval = double(sparse_colval);
    end
    g1 = sparse(sparse_rowval, sparse_colval, g1_v, 9, 27);
end
end
