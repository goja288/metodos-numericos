function [autoVector,autoValor,errores,iter] = Potencia2(G, maxiters,alpha,tolerancia) 

% http://pubs.doc.ic.ac.uk/hypergraph-fast-pagerank/hypergraph-fast-pagerank.pdf

%load matrices/wb-cs-stanford.mat;
%G = Problem.A;

%load matrices/harvard500.mat;
%G = G' - diag(diag(G));

%G = [0 0 1 0; 1 0 1 0; 0 0 0 1; 1 0 1 0];

[n,n] = size(G);
d = zeros(1, n);
p = zeros(1, n);

for j = 1:n
    L{j} = find(G(:,j));
    c(j) = length(L{j});
    if (c(j)== 0)
		d(j)= 1;
    else
		P (:, j) = G (:, j) /c(j);
	end
	p(j)= 1/n;
end 


D = p'*d;
T = P + D;

x0=p;
iter = 0;
%maxiters = 1000;
errores = zeros(1,maxiters+1);
error = 1;
%tolerancia = 10^-10;
omega = 0;

while (iter < maxiters && error > tolerancia)
	y = alpha * x0 * P;
	omega = norm (x0,1) - norm (y,1);
	x = y + omega * p;
	error = norm (x - x0,1);
	errores(iter+1) = error;
	x0 = x;
	iter++;
end

autoValor = sum(x);
autoVector = x;
iter;

endfunction
