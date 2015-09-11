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
