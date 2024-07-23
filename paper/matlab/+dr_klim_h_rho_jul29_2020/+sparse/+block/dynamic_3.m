function [y, T] = dynamic_3(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T)
  y(31)=y(26)/y(23);
  y(29)=y(20)-params(7);
end
