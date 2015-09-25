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

function [x,iter] = GaussSeidel(A,b,umbral, iterMax)

%Inicializacion de las variables
n = length(A);
LUD = zeros (n);
x = zeros (n, 1);
error = ones (1, n);

%Genero una matriz con los valores de la Matriz A pero sin su diagonal.
LUD = A - diag(diag(A));
iter = 0;

%iterMax=70; % control de iteraciones
%umbral= 10^-10;  % umbral de parada

while (iter < iterMax && max(error) >= umbral)
  xAnterior = x;
  for i = 1:n
    x(i) = (b(i)-LUD(i,:)*xAnterior) / A(i,i); 
	error(i) = abs(xAnterior(i) - x(i)); % calculo el error por item del vector.
  end
  iter ++;
 
end
endfunction

