function PageRankMN()

	p = 0.85; % Probabilidad p

	load matrices/harvard500.mat
	G = G - diag(diag(G));
	
	%G = [0 0 1 0; 1 0 1 0; 0 1 0 0; 1 0 1 0];
	%G = [1 -1 4; 3 2 -1; 2 1 -1];
	%G =  [0 0 0 1 0 1; 1 0 0 0 0 0; 0 1 0 0 0 0; 0 1 1 0 0 0; 0 0 1 0 0 0; 1 0 1 0 0 0]
	
	[n,n] = size(G);
	
	%I = speye(n,n); % creo la matriz identidad como esparsa
	I = eye(n,n); % creo la matriz identidad
	
	% Quiero obtener la matriz D
	D = zeros(n,n);
	for j = 1:n
    	L{j} = find(G(:,j));
    	c(j) = length(L{j}); % aca obtengo cuantos unos hay en la columna
		if (c(j) > 0)
			D(j,j) = 1/c(j); 
		end
	end	
	
	
	
	A = (I - p*(G*D));
	
	b = ones(n,1);
	
	
	x = GaussSeidel(A,b);
	x = x/sum(x);
	sum(x)
	max(x)
	
endfunction

%%%% 

function x = GaussSeidel(A,b,es,maxit)

	% x = GaussSeidel(A,b):
	%   Gauss Seidel method.
	% input:
	%   A = coefficient matrix
	%   b = right hand side vector
	%   es = (optional) stop criterion (%) (default = 0.00001)
	%   maxit = (optional) max iterations (default = 50)
	% output:
	%   x = solution vector

	if nargin<4, maxit=50; end
	if nargin<3, es=0.00001; end
	[m,n] = size(A);
	if m~=n, error('Matrix A must be square'); end
	C = A;
	for i = 1:n
		C(i,i) = 0;
		x(i) = 0;
	end
	x = x';
	for i = 1:n
		C(i,1:n) = C(i,1:n)/A(i,i);
	end
	for i = 1:n
		d(i) = b(i)/A(i,i);
	end

	iter = 0;
	while (1)
	  xold = x;
	  for i = 1:n
		x(i) = d(i)-C(i,:)*x;
		if x(i) ~= 0
		  ea(i) = abs((x(i) - xold(i))/x(i)) * 100;
		end
	  end
	  iter = iter+1;
	  if max(ea)<=es | iter >= maxit,
		 break,
	  end
	end
endfunction

