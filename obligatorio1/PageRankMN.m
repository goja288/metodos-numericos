function [autoVector, iter] = PageRankMN(G, maxIteraciones,p,tolerancia)

	[n,n] = size(G);
	
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
		
	[x,iteracionGS] = GaussSeidel(A,b,tolerancia,maxIteraciones);

	autoVector = x/sum(x); % Normalizado
	iter = iteracionGS; % Cuantas iteraciones llevo encontrar 
	
endfunction

%%%% 

function [x,iter] = GaussSeidel(A,b,es,maxit)

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
	  if max(ea)<=es || iter >= maxit,
		 break,
	  end
	end
endfunction

