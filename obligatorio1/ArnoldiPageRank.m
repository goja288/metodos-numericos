function [x,res,I] = ArnoldiPageRank(A,max_bases,alpha,tol)
	disp('Arnoldi Page Rank');

	#chequear columnas vacias
	d = columnasVacias(A);

	#crear bases
	[V,H,res,I] = BaseArnoldi(A,max_bases,alpha,tol,d);

	[EVEC,EVAL] = eig(full(H));
	#busco el mayor valor propio y su indice
	[eigval ind] = max(diag(EVAL));

	#busco el vector propio primario de H
	firstvec = EVEC(:,ind);

	#traer vector propio primario
	eigvec = V*firstvec;

	#normalizar
	eigvec = eigvec./norm(eigvec,1);

	#si negativo
	if (eigvec(1)<0) eigvec = abs(eigvec); end

	x = eigvec; 
endfunction
