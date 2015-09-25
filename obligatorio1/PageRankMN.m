function PageRankMN()

	p = 0.85; % Probabilidad p

	load matrices/harvard500.mat
	G = G'- diag(diag(G));
	
	%G = [0 0 1 0; 1 0 1 0; 0 1 0 0; 1 0 1 0];
	
	
	[n,n] = size(G);
	
	I = eye(n); % creo la matriz identidad
	
	
	% Quiero obtener la matriz D
	D = zeros(n,n);
	for j = 1:n
    	L{j} = find(G(:,j));
    	c(j) = length(L{j}); % aca obtengo cuantos unos hay en la columna
		if (c(j) > 0)
			D(j,j) = 1/n; 
		end
	end	
	
	
	
	
	A = (I - p*G*D);
	b = ones(n,1);
	
	%A
	%b
	%D
	%c
	%I
	
	gauss_seidel(A,b,100);
	
endfunction

%%%% 

function gauss_seidel(A, b, N)

	%Gauss_seidel(A, b, N) solve iteratively a system of linear equations 
	%whereby A is the coefficient matrix, and b is the right-hand side column vector.
	%N is the maximum number of iterations.
	%The method implemented is the Gauss-Seidel iterative. 
	%The starting vector is the null vector, but can be adjusted to one's needs.
	%The iterative form is based on the Gauss-Seidel transition/iteration matrix
	%Tg = inv(D-L)*U and the constant vector cg = inv(D-L)*b.
	%The output is the solution vector x.

	%This file follows the algorithmic guidelines given in the book 
	%Numerical Analysis, 7th Ed, by Burden & Faires

	%Author: Alain G. Kapitho
	%Date  : Dec. 2005
	%Rev.  : Aug. 2007


	n = size(A,1);
	%splitting matrix A into the three matrices L, U and D
	D = diag(diag(A));
	L = tril(-A,-1);
	U = triu(-A,1);

	%transition matrix and constant vector used for iterations
	Tg = inv(D-L)*U; 
	cg = inv(D-L)*b;

	tol = 1e-10;
	k = 1;
	x = zeros(n,1);			%starting vector
	x(1) = 1;

	while k <= N
	   x(:,k+1) = Tg*x(:,k) + cg;
	   if norm(x(:,k+1)-x(:,k)) < tol
		  disp('The procedure was successful')
		  disp('Condition ||x^(k+1) - x^(k)|| < tol was met after k iterations')
		  disp(k); 
		  disp('x = ');
		  %disp(x(:,k+1));
		  sum(x(:,k+1))
		  
		  y = x(:,k+1) / norm(x(:,k+1));
		  sum(y)
		  max(y)
		  
		  break
	   end
	   k = k+1;
	end

	if norm(x(:,k+1)- x(:,k)) > tol || k > N
	   disp('Maximum number of iterations reached without satisfying condition:')
	   disp('||x^(k+1) - x^(k)|| < tol'); disp(tol);
	   disp('Please, examine the sequence of iterates')
	   disp('In case you observe convergence, then increase the maximum number of iterations')
	   disp('In case of divergence, the matrix may not be diagonally dominant')
	   disp(x');
	   
	end
endfunction
