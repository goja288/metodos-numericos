function [V,h,res,I] = BaseArnoldi(A,max_bases,alpha,tol,d)
	#tamano de primer columna de A
	n = size(A,1);
	#matriz sparsa de max_bases+1 * max_bases+1
	h = sparse(zeros(max_bases+1,max_bases+1));
	#vector de n unos/n
	V = ones(n,1)/n;
	#vector normalizado
	V = V/norm(V,2)
	#iteracion
	for(j=1:max_bases)
		#V(:,j) es columna j de V.
		w = MxV(A,V(:,j),alpha,d);
		for(i=1:j)
			h(i,j)=w'*V(:,i);
			w = w-h(i,j)*V(:,i);
		end
		h(j+1,j)=norm(w,2);
	
		if h(j+1,j) < 1e-12
			fprintf(1,'w has \"vanished": %g',h(j+1,j))
			break
		end
	
		vtemp = w/h(j+1,j);
		V = [V vtemp];

		#residuo eficiente
		[EVEC,EVAL] = eig(full(h(1:j,1:j)));
		[tmp ind] = max(diag(EVAL));
		cheapres = h(j+1,j)*abs(EVEC(j,ind));
	
		fprintf(1,'iter:%d res=%g \t(tol=%g)\n',j,cheapres,tol)

		if cheapres < tol;
			break
		end
	end
	res  =cheapres;
	I = j;
	if j==max_bases
		h = h(1:j+1,1:j+1);
	else 
		h = h(1:j,1:j);
	end
endfunction
