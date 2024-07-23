function [y, T] = static_3(y, x, params, sparse_rowval, sparse_colval, sparse_colptr, T)
  y(15)=y(10)/y(7);
  y(13)=y(4)-params(7);
end
