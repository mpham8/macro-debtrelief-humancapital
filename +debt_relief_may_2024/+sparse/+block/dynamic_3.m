function [y, T] = dynamic_3(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T)
  y(32)=y(27)/y(24);
  y(30)=y(21)-params(7);
end
