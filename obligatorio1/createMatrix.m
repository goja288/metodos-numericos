function [A] = createMatrix(dim)
#crear matriz esparsa de dim*dim
	A = sparse(dim,dim);
	maxnel = min(16,dim);
	for i = 1:dim
		nel = floor(rand(1)*maxnel);
		if(nel == 0)
			val = 0;
		else
			val = 1/nel;
		end
		for j = 1:nel
			col_ind = ceil(rand(1)*dim);
			while(A(col_ind,i) ~= 0)
				col_ind = ceil(rand(1)*dim);
			end
			A(col_ind,i) = val;
		end
	end
endfunction
