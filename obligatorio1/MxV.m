function [y] = MxV(A,v,alpha,d)
	#Tamano de A
	n = size(v,1);
	#Vector de todos 1
	e = ones(n,1);
	#Vector resultado
	y=alpha*A*v;
	# ?? esto viene de check empty columns.
	beta = alpha*d'*v + (1-alpha)*e'*v;
	y = y+beta*e/n;
endfunction
