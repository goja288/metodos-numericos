function [autoVector,autoValor,errores,iter] = Sistema(A,max_bases,alpha,tol)
	#chequear columnas vacias
	d = columnasVacias(A);

	#crear bases
	[V,H,errores,I] = BaseArnoldi(A,max_bases,alpha,tol,d);

	#busco vector y valor propio de H.
	#uso eig porque H es chica, aun cuando A es grande.
	[EVEC,EVAL] = eig(full(H));
	#Saco dimensiones de H para mostrar lo anterior.
	ch = columns(full(H));
	rh = rows(full(H));
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

	autoVector = eigvec; 
	autoValor = sum(autoVector);
	iter = I;
endfunction

%%%%%%%%%%%%%%%%%%
%% Base Arnoldi %%
%%%%%%%%%%%%%%%%%%

function [V,h,res,I] = BaseArnoldi(A,max_bases,alpha,tol,d)
	#vector residuos
	res = zeros(1,max_bases+1);
	#tamano de primer columna de A
	n = size(A,1);
	#matriz sparsa de max_bases+1 * max_bases+1
	h = sparse(zeros(max_bases+1,max_bases+1));
	#vector base inicial de n unos/n
	V = ones(n,1)/n;
	#vector base inicial normalizado
	V = V/norm(V,2);
	#iteracion
	for(j=1:max_bases)
		#Calculo proximo vector base
		#V(:,j) es columna j de V.
		#w es el vector a ortogonalizar
		w = MxV(A,V(:,j),alpha,d);
		#los w son ortogonales y generan el subespacio Kn
		#ortogonalizo con gran-shmidt
		for(i=1:j)
			h(i,j)=w'*V(:,i);
			w = w-h(i,j)*V(:,i);
		end
		#voy llenando la matriz H
		h(j+1,j)=norm(w,2);
	
		if h(j+1,j) < 1e-12
			break
		end
		#para la proxima iteracion
		vtemp = w/h(j+1,j);
		V = [V vtemp];

		#calculo el residuo de forma eficiente
		[EVEC,EVAL] = eig(full(h(1:j,1:j)));
		[tmp ind] = max(diag(EVAL));
		cheapres = h(j+1,j)*abs(EVEC(j,ind));
	
		%fprintf(1,'iter:%d res=%g \t(tol=%g)\n',j,cheapres,tol)
		#condicion de parada
		if cheapres < tol;
			break
		end
		res(j) = cheapres;
	end

	I = j;
	if j == max_bases
		h = h(1:j+1,1:j+1);
	else 
		h = h(1:j,1:j);
	end
endfunction

%%%%%%%%%%%%%%%%%%%%
%% columnasVacias %%
%%%%%%%%%%%%%%%%%%%%

function [d] = columnasVacias(A)
#devuelve vector marcando columnas vacias
	#d matriz esparsa de #numerodefilasdeA x 1
	d = sparse(size(A,1),1);
	#de 1 a numero de columnas
	for i=1:size(A,2)
		#si la suma de toda la columnas es cero
		if sum(A(:,i))==0
			#marco su indice en el vector a devolver.
			d(i)=1;
		end
	end
endfunction

%%%%%%%%%
%% MxV %%
%%%%%%%%%

function [y] = MxV(A,v,alpha,d)
	#Tamano de A
	n = size(v,1);
	#Vector de todos 1
	e = ones(n,1);
	#Vector resultado
	y = alpha*A*v;
	# ?? esto viene de check empty columns.
	beta = alpha*d'*v + (1-alpha)*e'*v;
	y = y+beta*e/n;
endfunction
