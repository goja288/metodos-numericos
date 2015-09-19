function [V,h,res,I] = BaseArnoldi(A,max_bases,alpha,tol,d)
	#tamano de primer columna de A
	n = size(A,1);
	#matriz sparsa de max_bases+1 * max_bases+1
	h = sparse(zeros(max_bases+1,max_bases+1));
	#vector base inicial de n unos/n
	V = ones(n,1)/n;
	#vector base inicial normalizado
	V = V/norm(V,2)
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
			fprintf(1,'w has \"vanished": %g',h(j+1,j))
			break
		end
		#para la proxima iteracion
		vtemp = w/h(j+1,j);
		V = [V vtemp];

		#calculo el residuo de forma eficiente
		[EVEC,EVAL] = eig(full(h(1:j,1:j)));
		[tmp ind] = max(diag(EVAL));
		cheapres = h(j+1,j)*abs(EVEC(j,ind));
	
		fprintf(1,'iter:%d res=%g \t(tol=%g)\n',j,cheapres,tol)
		#condicion de parada
		if cheapres < tol;
			break
		end
	end
	#devolver el residuo
	res  = cheapres;

	I = j;
	if j == max_bases
		h = h(1:j+1,1:j+1);
	else 
		h = h(1:j,1:j);
	end
endfunction
