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
