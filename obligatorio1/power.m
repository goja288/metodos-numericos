function [vec, value] = power(q, A, tol)
  %
  %Power method for computing eigenvalues
  %
  distancia = 1
  maxiter = 100
  iter = 0
  b_i = q
 
  
  while distancia > tol && iter < maxiter
    % A \times b_i 
    Axb_i = A * b_i ;
    norm_Axb_i = norm(Axb_i);
    % b_{i+1} = A \times b_i / || A \times b_i ||
    b_ip1 = Axb_i / norm_Axb_i ;
    distancia = norm ( b_ip1 - b_i) ;
    iter = iter + 1
    vec = b_ip1;
    value = norm_Axb_i;
    b_i = b_ip1;
  end  
 
endfunction
